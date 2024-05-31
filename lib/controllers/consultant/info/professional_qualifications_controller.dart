import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_utils.dart';

class ProfessionalQualificationsController extends GetxController {
  List expertises = [
    "Medicine",
    "General",
    "Doctors Home`s",
    "Doctor Clinic",
    "Patient`s Home"
  ];

  List degrees = ["MBBS", "BDS", "BSN"];
  List category = ["Dentistry", "Neurology", "General"];

  List years = ["2 years", "3 years", "4 years", "6 years"];
  List expertiseList = [];

  TextEditingController expertiseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passingYearController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  removeExpertise(value) {
    expertiseList.remove(value);
    update();
  }

  selectedExpertises(int index) {
    String expertise = expertises[index].toString();
    if (expertiseList.length < 2 && !expertiseList.contains(expertise)) {
      expertiseList.add(expertise);
      update();
      Get.back();
    } else {
      Get.back();
      Utils.snackBarMessage(expertiseList.length.toString(),
          "your are already selected ${expertiseList.length}".tr);
    }
  }

  selectedCategory(int index) {
    categoryController.text = category[index].toString();
    update();
    Get.back();
  }

  selectedDegree(int index) {
    degreeController.text = degrees[index].toString();
    update();
    Get.back();
  }

  selectedYear(int index) {
    durationController.text = years[index].toString();
    update();
    Get.back();
  }

  Future<void> yearPicker() async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // <-- SEE HERE
              onPrimary: AppColors.white, // <-- SEE HERE
              onSurface: AppColors.secondPrimary, // <-- SEE HERE
            ),
          ),
          child: child!),
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      keyboardType: TextInputType.visiblePassword,
      onDatePickerModeChange: (value) {
        print(value);
      },
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null) {
      passingYearController.text = "${picked.year}";
    }
  }
}
