import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../helpers/other_helper.dart';

class DoctorHomeController extends GetxController {
  List patients = [];

  TextEditingController listDateController = TextEditingController();
  TextEditingController requestDateController = TextEditingController();

  openListDatePicker() {
    OtherHelper.datePicker(listDateController);
  }
  openRequestDatePicker() {
    OtherHelper.datePicker(requestDateController);
  }
}
