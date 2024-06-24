import 'dart:convert';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/prefs_helper.dart';
import '../../../models/api_response_model.dart';
import '../../../models/chat_list_model.dart';
import '../../../services/api_service.dart';
import '../../../services/socket_service.dart';
import '../../../utils/app_utils.dart';

class ChatController extends GetxController {
  Status status = Status.completed;

  bool isMoreLoading = false;

  int page = 1;

  List chats = [];

  ChatListModel chatModel = ChatListModel.fromJson({});

  ScrollController scrollController = ScrollController();

  static ChatController get instance => Get.put(ChatController());

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await getChatRepo();
      isMoreLoading = false;
      update();
    }
  }

  Future<void> getChatRepo() async {
    if (page == 1) {
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi("${AppUrls.chats}?page=$page");

    if (response.statusCode == 200) {
      chatModel = ChatListModel.fromJson(jsonDecode(response.body));

      chats.addAll(chatModel.data.attributes.chatList);

      page = page + 1;
      status = Status.completed;
      update();
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
      status = Status.error;
      update();
    }
  }

  listenMessage() async {
    SocketServices.socket.on("update-chatlist::${PrefsHelper.userId}", (data) {
      status = Status.loading;
      update();

      page = 1;
      ChatListModel chatListModel;
      chatListModel = ChatListModel.fromJson(data);

      chats.clear();
      chats.addAll(chatListModel.data.attributes.chatList);

      print("============================================>$data");

      status = Status.completed;
      update();
    });
  }

  @override
  void onInit() {
    getChatRepo();
    super.onInit();
  }
}
