import 'dart:convert';

import 'package:dime/extension/my_extension.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:dime/models/api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/appointment_upcoming_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class PatientsDetailsController extends GetxController {
  Status status = Status.completed;
  String isLoading = '';

  bool isLoadingUpload = false;

  TextEditingController callDurationController = TextEditingController();
  TextEditingController bookingDateController = TextEditingController();
  TextEditingController bookingTimeController = TextEditingController();

  Appointment appointment = Appointment.fromJson({});

  String video = '';

  getVideo() async {
    String? value = await OtherHelper.getVideo();

    if (value != null) {
      video = value;
      update();
    }
  }

  uploadVideo() async {
    isLoadingUpload = true;
    update();

    var response = await ApiService.multipartRequest(
        url: "${AppUrls.videoReply}/${appointment.id}",
        files: [
          {"name": "video", "file": video}
        ]);

    if (response.statusCode == 200) {
      Utils.toastMessage(response.message);
      Get.back();
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoadingUpload = false;
    update();
  }

  static PatientsDetailsController get instance =>
      Get.put(PatientsDetailsController());

  getAppointmentRepo(String chatId) async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi("${AppUrls.appointments}/$chatId");

    if (response.statusCode == 200) {
      appointment =
          Appointment.fromJson(jsonDecode(response.body)['data']['attributes']);

      callDurationController.text = appointment.duration.toString();
      bookingDateController.text = appointment.appointmentTime.date;
      bookingTimeController.text = appointment.appointmentTime.time;

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  updateAppointmentRepo(String status, String chatId) async {
    isLoading = status;
    update();

    var body = {
      "status": status //'approved', 'rejected
    };

    var response = await ApiService.patchApi("${AppUrls.appointments}/$chatId",
        body: body);

    if (response.statusCode == 200) {
      appointment =
          Appointment.fromJson(jsonDecode(response.body)['data']['attributes']);

      callDurationController.text = appointment.duration.toString();
      bookingDateController.text = appointment.appointmentTime.date;
      bookingTimeController.text = appointment.appointmentTime.time;

      if (status == 'approved') {
        Utils.snackBarMessage("Approved Appointment", "Wait for payment");
      }

      isLoading = '';
      update();
    } else {
      isLoading = '';
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
