import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';

class ScheduleReplyController extends GetxController {
  bool isLoading = false;

  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  static ScheduleReplyController get instance =>
      Get.put(ScheduleReplyController());

  bookVideoReplyAppointment(String id, String amount) async {
    isLoading = true;
    update();

    var body = {
      "consultant": id,
      "subject": subjectController.text,
      "description": descriptionController.text,
      "amount": amount,
      "type": "video-reply",
      "duration": '1'
    };

    var response = await ApiService.postApi(AppUrls.appointments, body);
    isLoading = false;
    update();

    if (response.statusCode == 200) {
      Get.toNamed(AppRoutes.myBooking, parameters: {"index": "0"});
    }
  }
}
