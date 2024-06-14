import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class AvailabilityController extends GetxController {
  List week = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];

  bool isLoading = false;

  List selectedWeekList = [];

  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController videoConferenceFeeController = TextEditingController();
  TextEditingController videoReplyFeeController = TextEditingController();

  selectWeek(int index) {
    String selectedWeek = week[index].toString();
    if (!selectedWeekList.contains(selectedWeek)) {
      selectedWeekList.add(selectedWeek);
      update();
    }
  }

  updateProfileRepo(type) async {
    isLoading = true;
    update();
    var body = {
      "availability": {
        "day": selectedWeekList,
        "startTime": startController.text,
        "endTime": endController.text,
        "videoConferenceFee": videoConferenceFeeController.text,
        "videoReplyFee": videoReplyFeeController.text,
      },
    };

    var response =
        await ApiService.putApi(AppUrls.user, {"data": jsonEncode(body)});

    if (response.statusCode == 200) {
      if (type == "back") {
        Get.back();
      } else {
        Get.toNamed(AppRoutes.identificationScreen);
      }
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
