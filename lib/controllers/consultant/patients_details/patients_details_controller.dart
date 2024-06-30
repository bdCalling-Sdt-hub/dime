import 'dart:convert';

import 'package:dime/extension/my_extension.dart';
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

  TextEditingController callDurationController = TextEditingController();
  TextEditingController bookingDateController = TextEditingController();
  TextEditingController bookingTimeController = TextEditingController();

  Appointment appointment = Appointment.fromJson({});

  static PatientsDetailsController get instance =>
      Get.put(PatientsDetailsController());

  getAppointmentRepo(String chatId) async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi("${AppUrls.appointments}/$chatId");

    if (response.statusCode == 200) {
      appointment =
          Appointment.fromJson(jsonDecode(response.body)['data']['attributes']);

      print("appointment $chatId");

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

      isLoading = '';
      update();
    } else {
      isLoading = '';
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
