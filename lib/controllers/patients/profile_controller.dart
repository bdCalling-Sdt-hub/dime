import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  List languages = ["English", "French", "Arabic"];
  List gender = const ["Male", "Female", "Other"];

  String selectedLanguage = "English";

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  selectedGender(int index) {
    genderController.text = gender[index].toString();
    update();
    Get.back();
  }

  selectLanguage(int index) {
    selectedLanguage = languages[index];
    print(selectedLanguage);
    update();
    Get.back();
  }
}
