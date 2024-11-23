import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/other_helper.dart';
import '../../../models/appointment_upcoming_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class PatientsListController extends GetxController {
  Status status = Status.completed;
  bool isMoreLoading = false;

  List appointments = [];

  String dateTime = "";

  AppointmentsUpcomingModel appointmentsUpcomingModel =
      AppointmentsUpcomingModel.fromJson({});

  static PatientsListController get instance =>
      Get.put(PatientsListController());

  TextEditingController dateController = TextEditingController();

  openDatePicker() async {
    dateTime = await OtherHelper.datePicker(dateController);
    if (dateTime.isNotEmpty) {
      appointments.clear();
      getAppointmentsRepo();
    }
  }

  ScrollController scrollController = ScrollController();

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await getAppointmentsRepo();
      isMoreLoading = false;
      update();
    }
  }

  getAppointmentsRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
        "${AppUrls.appointment}?status=upcoming&dateTime=$dateTime");

    if (response.statusCode == 200) {
      appointmentsUpcomingModel =
          AppointmentsUpcomingModel.fromJson(jsonDecode(response.body));

      appointments
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
