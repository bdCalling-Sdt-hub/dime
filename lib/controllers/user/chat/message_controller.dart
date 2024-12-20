import 'dart:async';
import 'dart:convert';
import 'package:dime/models/api_response_model.dart';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes.dart';
import '../../../helpers/prefs_helper.dart';
import '../../../models/chat_message_model.dart';
import '../../../models/message_model.dart';
import '../../../services/api_service.dart';
import '../../../services/socket_service.dart';
import '../../../utils/app_utils.dart';

class MessageController extends GetxController {
  bool isLoading = false;
  bool isMoreLoading = false;
  String? video;

  List messages = [];

  String chatId = "";
  String name = "";
  String image = "";
  String agoraToken = "";
  String channel = "";
  int duration = 0;
  DateTime startTime = DateTime.parse("2024-08-01T08:35:00.000Z");

  int page = 1;
  int currentIndex = 0;
  Status status = Status.completed;

  bool isMessage = false;
  bool isInputField = false;

  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  static MessageController get instance => Get.put(MessageController());

  MessageModel messageModel = MessageModel.fromJson({});

  checkVideoCall() {
    DateTime currentTime = DateTime.now();

    if (kDebugMode) {
      print(startTime);
    }

    Get.toNamed(AppRoutes.videoCall, parameters: {
      "token": agoraToken,
      "channel": channel,
      "name": name,
      "image": image
    });

    // if (currentTime.isAfter(startTime) &&
    //     currentTime.isBefore(startTime.add(Duration(minutes: duration)))) {
    //   Get.toNamed(AppRoutes.videoCall, parameters: {
    //     "token": agoraToken,
    //     "channel": channel,
    //     "name": name,
    //     "image": image
    //   });
    // }
  }

  Future<void> getMessageRepo() async {
    if (page == 1) {
      messages.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrls.messages}?chatId=$chatId&page=$page&limit=15",
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data']['attributes']['messages'];

      for (var messageData in data) {
        messageModel = MessageModel.fromJson(messageData);

        messages.add(ChatMessageModel(
            time: messageModel.createdAt.toLocal(),
            text: messageModel.message,
            image: messageModel.sender.image,
            isCall: messageModel.type == "special",
            isNotice: messageModel.type == "notice" ? true : false,
            isMe: PrefsHelper.userId == messageModel.sender.id ? true : false));
      }

      agoraToken = jsonDecode(response.body)['data']['attributes']["videoCall"]
              ['agoraToken'] ??
          "";
      channel = jsonDecode(response.body)['data']['attributes']["videoCall"]
              ['channelName'] ??
          "";
      duration = jsonDecode(response.body)['data']['attributes']["videoCall"]
              ['duration'] ??
          0;
      startTime = DateTime.tryParse(jsonDecode(response.body)['data']
              ['attributes']["videoCall"]['startTime']) ??
          DateTime.now().add(const Duration(days: 10));
      page = page + 1;
      status = Status.completed;
      update();
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
      status = Status.error;
      update();
    }
  }

  addNewMessage() async {
    isMessage = true;
    update();

    messages.insert(
        0,
        ChatMessageModel(
            time: DateTime.now(),
            text: messageController.text,
            image: PrefsHelper.myImage,
            isMe: true)

        // ChatMessageModel(
        //     currentTime.format(context).toString(),
        //     controller.messageController.text,
        //     true),
        );

    isMessage = false;
    update();

    var body = {
      "chat": chatId,
      "message": messageController.text,
      "sender": PrefsHelper.userId
    };

    messageController.clear();

    SocketServices.socket.emitWithAck("add-new-message", body, ack: (data) {
      if (kDebugMode) {
        print(
            "===============================================================> Received acknowledgment: $data");
      }
    });
  }

  listenMessage() async {
    SocketServices.socket.on('new-message::$chatId', (data) {
      status = Status.loading;
      update();

      DateTime time = DateTime.tryParse(data['createdAt']) ?? DateTime.now();
      messages.insert(
          0,
          ChatMessageModel(
              isNotice: data['messageType'] == "notice" ? true : false,
              time: time.toLocal(),
              text: data['message'],
              image: data['sender']['image'],
              isMe: false));

      status = Status.completed;
      update();
    });
  }

  void isEmoji(int index) {
    currentIndex = index;
    isInputField = isInputField;
    update();
  }
}
