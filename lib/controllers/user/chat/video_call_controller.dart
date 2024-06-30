
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock/wakelock.dart';
import '../../../utils/payment_key.dart';

class VideoCallController extends GetxController {
  int remoteId = 0;
  bool localUserJoined = false;
  bool muted = false;
  bool isVolume = true;
  bool videoPaused = false;
  late RtcEngine engine;
  double dragHorizontal = 20.0;
  double dragVertical = 80.0;
  int userCount = 0;
  // String token = '';

  static VideoCallController get instance => Get.put(VideoCallController());

  clear() {
    engine.leaveChannel();
    engine.release();
    videoPaused = false;
    muted = false;
    localUserJoined = false;
    update();
  }

  Future<void> initialize() async {
    Future.delayed(Duration.zero, () async {
      // token = AgoraTokenBuilder.generateToken();

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
            if (remoteId == 0) {
              localUserJoined = true;
              remoteId = remoteUid;
            }
            update();

          },
          onRemoteVideoStateChanged:
              (connection, remoteUid, state, reason, elapsed) {
            if (state == RemoteVideoState.remoteVideoStateStopped) {
              videoPaused = true;
              update();
            } else {
              videoPaused = false;
              update();
            }
          },
          onUserOffline: (RtcConnection connection, int remoteUid,
              UserOfflineReasonType reason) {
            Wakelock.disable();
            remoteId = 0;
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
            onCallEnd();
          }),
    );
  }

  void setLocalVideo() {
    localUserJoined = !localUserJoined;
    engine.enableLocalVideo(localUserJoined);
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
    engine.adjustPlaybackSignalVolume(isVolume ? 10 : 100);
    isVolume = !isVolume;
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

    update();
  }
}

// class AgoraTokenBuilder {
//   static String generateToken() {
//     int currentTimeStamp =
//         (DateTime.now().millisecondsSinceEpoch / 1000).floor();
//     int privilegeExpiredTs = currentTimeStamp + 216000;
//
//     String uidStr = '';
//     String content = "$appId${appCertificate}Naimul$uidStr$privilegeExpiredTs";
//
//     Hmac hmac = Hmac(sha256, utf8.encode(appCertificate));
//     Digest hash = hmac.convert(utf8.encode(content));
//
//     return appId + hash.toString() + privilegeExpiredTs.toString();
//   }
// }
