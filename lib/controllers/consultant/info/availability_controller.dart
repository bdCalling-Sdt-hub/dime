import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class AvailabilityController extends GetxController {
  List<Map> week = [
    {
      'day': 'Sat',
      'startTime': "09:00",
      'endTime': "17:00",
    },
    {
      'day': 'Sun',
      'startTime': "09:00",
      'endTime': "17:00",
    },
    {
      'day': 'Mon',
      'startTime': "09:00",
      'endTime': "17:00",
    },
    {
      'day': 'Tue',
      'startTime': "09:00",
      'endTime': "17:00",
    },
    {
      'day': 'Wed',
      'startTime': "09:00",
      'endTime': "17:00",
    },
    {
      'day': 'Thu',
      'startTime': "09:00",
      'endTime': "17:00",
    },
    {
      'day': 'Fri',
      'startTime': "09:00",
      'endTime': "17:00",
    },
  ];

  bool isLoading = false;

  List<Map> selectedWeekList = [];

  TextEditingController videoConferenceFeeController = TextEditingController();
  TextEditingController videoReplyFeeController = TextEditingController();

  static AvailabilityController get instance =>
      Get.put(AvailabilityController());

  selectWeek(int index) {
    Map item = week[index];

    if (!selectedWeekList.contains(item)) {
      selectedWeekList.add(item);
      update();
    } else {
      selectedWeekList.indexOf(item);
      selectedWeekList.remove(item);
      update();
    }

    print(selectedWeekList);
  }

  updateWeek(Map item, Map newItem) {
    if (selectedWeekList.contains(item)) {
      selectedWeekList.remove(item);
      selectedWeekList.add(newItem);
      print(newItem);
    }
  }

  findItem(item) {
    try {
      Map foundItem = selectedWeekList.firstWhere((element) => element['day'] == item['day']);

      print('Item found: $foundItem');
      return foundItem;
    } catch (e) {
      // Handle the case where the item is not found
      print('Item not found');
      return {};
    }
  }

  updateProfileRepo(type) async {
    isLoading = true;
    update();
    var body = {
      "availability": selectedWeekList,
      "videoConferenceFee": videoConferenceFeeController.text,
      "videoReplyFee": videoReplyFeeController.text,
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
