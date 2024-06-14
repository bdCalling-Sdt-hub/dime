import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../helpers/other_helper.dart';
import '../../../models/appointment_upcoming_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class DoctorHomeController extends GetxController {
  List patients = [];
  List upcomingList = [];
  List pendingList = [];
  Status upcomingStatus = Status.completed;
  Status pendingStatus = Status.completed;

  TextEditingController listDateController = TextEditingController();
  TextEditingController requestDateController = TextEditingController();

  static DoctorHomeController get instance => Get.put(DoctorHomeController());

  AppointmentsUpcomingModel appointmentsUpcomingModel =
      AppointmentsUpcomingModel.fromJson({});

  openListDatePicker() {
    OtherHelper.datePicker(listDateController);
  }

  openRequestDatePicker() {
    OtherHelper.datePicker(requestDateController);
  }

  getUpcomingAppointmentRepo() async {
    upcomingStatus = Status.loading;
    update();

    var response =
        await ApiService.getApi("${AppUrls.appointment}?status=upcoming");

    if (response.statusCode == 200) {
      appointmentsUpcomingModel =
          AppointmentsUpcomingModel.fromJson(jsonDecode(response.body));

      upcomingList
          .addAll(appointmentsUpcomingModel.data.attributes.appointmentList);

      upcomingStatus = Status.loading;
      update();
    } else {
      upcomingStatus = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  getAppointmentRequestRepo() async {
    pendingStatus = Status.loading;
    update();

    var response =
        await ApiService.getApi("${AppUrls.appointment}?status=pending");

    if (response.statusCode == 200) {
      appointmentsUpcomingModel =
          AppointmentsUpcomingModel.fromJson(jsonDecode(response.body));

      pendingList
          .addAll(appointmentsUpcomingModel.data.attributes.appointmentList);

      pendingStatus = Status.loading;
      update();
    } else {
      pendingStatus = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
