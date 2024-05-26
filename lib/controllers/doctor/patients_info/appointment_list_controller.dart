import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/other_helper.dart';

class AppointmentListController extends GetxController {
  TextEditingController dateController = TextEditingController();

  openDatePicker() {
    OtherHelper.datePicker(dateController);
  }
}
