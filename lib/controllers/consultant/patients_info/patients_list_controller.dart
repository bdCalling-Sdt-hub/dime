import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../helpers/other_helper.dart';

class PatientsListController extends GetxController {
  TextEditingController dateController = TextEditingController();

  openDatePicker() {
    OtherHelper.datePicker(dateController);
  }

}
