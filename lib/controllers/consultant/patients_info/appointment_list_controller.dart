import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/other_helper.dart';
import '../../../models/appointment_upcoming_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class AppointmentListController extends GetxController {
  TextEditingController dateController = TextEditingController();
  Status status = Status.completed;
  List requests = [];
  ScrollController scrollController = ScrollController();
  bool isMoreLoading = false;
  String dateTime = "";

  AppointmentsUpcomingModel appointmentsUpcomingModel =
      AppointmentsUpcomingModel.fromJson({});

  static AppointmentListController get instance =>
      Get.put(AppointmentListController());

  openDatePicker() async {
    dateTime = await OtherHelper.datePicker(dateController);
    if (dateTime.isNotEmpty) {
      requests.clear();
      getAppointmentRequestRepo();
    }
  }

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await getAppointmentRequestRepo();
      isMoreLoading = false;
      update();
    }
  }

  getAppointmentRequestRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
        "${AppUrls.appointment}?status=pending&dateTime=$dateTime");

    if (response.statusCode == 200) {
      appointmentsUpcomingModel =
          AppointmentsUpcomingModel.fromJson(jsonDecode(response.body));

      requests
          .addAll(appointmentsUpcomingModel.data.attributes.appointmentList);

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
