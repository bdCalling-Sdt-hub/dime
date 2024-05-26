import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/chat_message_model.dart';
import '../../utils/app_images.dart';


class MessageController extends GetxController {
  bool isLoading = false;
  bool isMoreLoading = false;

  List messages = [
    ChatMessageModel(
        image: AppImages.doctorSarah, text: "hello", isMe: false, time: "9:30"),
    ChatMessageModel(
        image: AppImages.profile, text: "hello", isMe: true, time: "9:30"),
    ChatMessageModel(
        image: AppImages.doctorSarah, text: "hello", isMe: false, time: "9:30")
  ];

  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();
}
