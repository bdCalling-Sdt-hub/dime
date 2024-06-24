import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:dime/models/notification_model.dart';
import 'package:dime/services/api_service.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  List notifications = [];
  Status status = Status.completed;

  getNotificationsRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.notifications);

    if (response.statusCode == 200) {
      var notificationList =
          jsonDecode(response.body)['data']['attributes']['notificationList'];

      for (var notification in notificationList) {
        notifications.add(NotificationModel.fromJson(notification));
      }

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  @override
  void onInit() {
    getNotificationsRepo();
    super.onInit();
  }
}
