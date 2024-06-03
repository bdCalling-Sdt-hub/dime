import 'package:dime/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  List languages = ["English", "French", "Arabic"];
  List gender = const ["Male", "Female", "Other"];

  String selectedLanguage = "English";
  String? image;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();



  selectedGender(int index) {
    genderController.text = gender[index].toString();
    update();
    Get.back();
  }

  getProfileImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  selectLanguage(int index) {
    selectedLanguage = languages[index];
    print(selectedLanguage);
    update();
    Get.back();
  }
}
