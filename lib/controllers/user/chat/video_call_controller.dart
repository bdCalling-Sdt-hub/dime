import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock/wakelock.dart';

import '../../../helpers/prefs_helper.dart';
import '../../../models/api_response_model.dart';
import '../../../models/chat_message_model.dart';
import '../../../utils/app_images.dart';
import '../../../utils/payment_key.dart';


class VideoCallController extends GetxController {
  RxInt myremoteUid = 0.obs;
  RxBool localUserJoined = false.obs;
  RxBool muted = false.obs;
  RxBool isVolume = false.obs;
  RxBool videoPaused = false.obs;
  RxBool isVideo = false.obs;
  RxBool switchMainView = false.obs;
  RxBool mutedVideo = false.obs;
  RxBool reConnectingRemoteView = false.obs;
  RxBool isFront = false.obs;
  late RtcEngine engine;

  Status status = Status.completed;
  bool isLoading = false;
  bool isMoreLoading = false;

  List messages = [];

  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  clear() {
    engine.leaveChannel();
    isFront.value = false;
    reConnectingRemoteView.value = false;
    videoPaused.value = false;
    muted.value = false;
    mutedVideo.value = false;
    switchMainView.value = false;
    localUserJoined.value = false;
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
            localUserJoined.value = true;
            update();
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            localUserJoined.value = true;
            myremoteUid.value = remoteUid;
            print("remoteUid $remoteUid");
            update();
          },
          onUserOffline: (RtcConnection connection, int remoteUid,
              UserOfflineReasonType reason) {
            if (reason == UserOfflineReasonType.userOfflineDropped) {
              Wakelock.disable();
              myremoteUid.value = 0;
              print("remoteUid $remoteUid");
              onCallEnd();
              update();
            } else {
              myremoteUid.value = 0;
              onCallEnd();
              update();
            }
          },
          onRemoteVideoStats:
              (RtcConnection connection, RemoteVideoStats remoteVideoStats) {
            if (remoteVideoStats.receivedBitrate == 0) {
              videoPaused.value = true;
              print(
                  "remoteVideoStats.receivedBitrate ${remoteVideoStats.receivedBitrate}");
              update();
            } else {
              videoPaused.value = false;
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
    localUserJoined.value = !localUserJoined.value;
    if (localUserJoined.value) {
      engine.enableVideo();
    } else {
      engine.disableVideo();
    }
  }

  void onCallEnd() {
    clear();
    update();
    Get.back();
  }

  void muteMic() {
    muted.value = !muted.value;
    engine.muteLocalAudioStream(muted.value);
  }

  void setVolume() {
    isVolume.value = !isVolume.value;
    engine.adjustRecordingSignalVolume(isVolume.value ? 100 : 25);
    engine.adjustPlaybackSignalVolume(isVolume.value ? 100 : 25);
  }




}

class TherapistController extends GetxController {
  TextEditingController searchPatentName = TextEditingController();

  TextEditingController messageController = TextEditingController();

  RxInt index = 0.obs;
  RxString sendMessage = ''.obs;
  File? selectedMessageImage;
  RxBool isCallConnected = true.obs;
  RxBool isVideoCall = false.obs;
  RxBool isVolumeMute = false.obs;
  RxBool isMicMute = false.obs;
  Rx<Offset> position = Offset(80.0, 20.0).obs;
  RxDouble dragHorizontal = 20.0.obs;
  RxDouble dragVertical = 80.0.obs;

  Map sessionListMap = {"totalSessions": 26, "completeSessions": 03};

  Future openGallery() async {
    final pickImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedMessageImage = File(pickImage!.path);
    update();
  }

// Future<void> openCamera() async{
//   final cameras = await availableCameras();
//   Get.to(VideoCallScreen(cameras: cameras));
// }
}