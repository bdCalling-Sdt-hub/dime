import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock/wakelock.dart';
import '../../../models/api_response_model.dart';
import '../../../utils/payment_key.dart';

class VideoCallController extends GetxController {
  int myRemoteUid = 0;
  bool localUserJoined = false;
  bool muted = false;
  bool isVolume = false;
  bool videoPaused = false;
  bool isVideo = false;
  bool switchMainView = false;
  bool mutedVideo = false;
  bool reConnectingRemoteView = false;
  bool isFront = false;
  late RtcEngine engine;
  Status status = Status.completed;
  bool isLoading = false;
  bool isMoreLoading = false;
  double dragHorizontal = 20.0;
  double dragVertical = 80.0;

  List messages = [];

  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  static VideoCallController get instance => Get.put(VideoCallController());

  clear() {
    engine.leaveChannel();
    isFront = false;
    reConnectingRemoteView = false;
    videoPaused = false;
    muted = false;
    mutedVideo = false;
    switchMainView = false;
    localUserJoined = false;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    clear();
  }

  Future<void> initilize() async {
    Future.delayed(Duration.zero, () async {
      await [Permission.microphone, Permission.camera].request();
      await _initAgoraRtcEngine();
      _addAgoraEventHandlers();
      await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
      VideoEncoderConfiguration configuration =
          const VideoEncoderConfiguration();
      await engine.setVideoEncoderConfiguration(configuration);
      await engine.leaveChannel();
      await engine.joinChannel(
        token: token,
        channelId: channel,
        uid: 0,
        options: const ChannelMediaOptions(),
      );

      update();
    });
  }

  Future<void> _initAgoraRtcEngine() async {
    engine = createAgoraRtcEngine();
    await engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));
    await engine.enableVideo();
    //await engine.startPreview();
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
  }

  void _addAgoraEventHandlers() {
    engine.registerEventHandler(
      RtcEngineEventHandler(
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            localUserJoined = true;
            update();
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            localUserJoined = true;
            myRemoteUid = remoteUid;
            update();
          },
          onUserOffline: (RtcConnection connection, int remoteUid,
              UserOfflineReasonType reason) {
            Wakelock.disable();
            myRemoteUid = 0;
            onCallEnd();
            update();
          },
          onRemoteVideoStats:
              (RtcConnection connection, RemoteVideoStats remoteVideoStats) {
            if (remoteVideoStats.receivedBitrate == 0) {
              videoPaused = true;
              update();
            } else {
              videoPaused = false;
              update();
            }
          },
          onTokenPrivilegeWillExpire:
              (RtcConnection connection, String token) {},
          onLeaveChannel: (RtcConnection connection, stats) {
            clear();
            onCallEnd();
            update();
          }),
    );
  }

  void setLocalVideo() {
    localUserJoined = !localUserJoined;
    if (localUserJoined) {
      engine.enableVideo();
    } else {
      engine.disableVideo();
    }
    update();
  }

  void onCallEnd() {
    clear();
    update();
    Get.back();
  }

  void muteMic() {
    muted = !muted;
    engine.muteLocalAudioStream(muted);
    update();
  }

  void setVolume() {
    isVolume = !isVolume;
    engine.adjustPlaybackSignalVolume(isVolume ? 25 : 100);
    update();
  }

  void onPanUpdate(details) async {
    double newDragHorizontal = dragHorizontal - details.delta.dx;
    double newDragVertical = dragVertical + details.delta.dy;
    double screenWidth = MediaQuery.of(Get.context!).size.width;
    double screenHeight = MediaQuery.of(Get.context!).size.height;

    double objectHeight = 135;
    double objectWidth = 100;

    if (newDragHorizontal < 0) {
      dragHorizontal = 0;
    } else if (newDragHorizontal > screenWidth - objectWidth) {
      dragHorizontal = screenWidth - objectWidth;
    } else {
      dragHorizontal = newDragHorizontal;
    }

    if (newDragVertical < 0) {
      dragVertical = 0;
    } else if (newDragVertical > screenHeight - objectHeight) {
      dragVertical = screenHeight - objectHeight;
    } else {
      dragVertical = newDragVertical;
    }

    print("value dx ${details.delta.dx}");
    print("dy ${details.delta.dy}");

    update();
  }
}
