import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:dime/controllers/user/chat/video_call_controller.dart';
import 'package:dime/extension/my_extension.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../utils/payment_key.dart';

Widget myVideoStream(bool isLocalUserJoined) {
  return isLocalUserJoined
      ? AgoraVideoView(
          controller: VideoViewController(
            rtcEngine: VideoCallController.instance.engine,
            canvas: const VideoCanvas(
              uid: 0,
            ),
          ),
        )
      : 0.height;
}

Widget remoteVideoStream(int remoteId) {
  return remoteId != 0
      ? AgoraVideoView(
          controller: VideoViewController.remote(
            rtcEngine: VideoCallController.instance.engine,
            canvas: VideoCanvas(uid: VideoCallController.instance.remoteId),
            connection: const RtcConnection(channelId: channel),
          ),
        )
      : 0.height;
}
