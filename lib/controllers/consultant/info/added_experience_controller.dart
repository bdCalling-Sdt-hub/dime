import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddedExperienceController extends GetxController {
  bool isCurrentlyWorking = false;

  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  onChange(bool? value) {
    if (value != null) {
      isCurrentlyWorking = value;
      update();
    }
  }
}
