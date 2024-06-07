import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/chat_message_model.dart';
import '../../utils/app_images.dart';

class MessageController extends GetxController {
  bool isLoading = false;
  bool isMoreLoading = false;
  String? video;

  List messages = [
    ChatMessageModel(
        image: AppImages.doctorSarah, text: "hello", isMe: false, time: "9:30"),
    ChatMessageModel(
        image: AppImages.profile, text: "hello", isMe: true, time: "9:30"),
    ChatMessageModel(
        image: AppImages.profile, text: "Join Video Call \n At 10:30", isMe: true, time: "9:30", isCall: true),
    ChatMessageModel(
        image: AppImages.doctorSarah, text: "hello", isMe: false, time: "9:30")
  ];

  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  getVideo() async {


    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
    );

    if (result != null && result.paths.isNotEmpty) {
      video = result.paths[0];
      update();
    }
  }
}
