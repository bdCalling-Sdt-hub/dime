import 'dart:convert';

import 'package:dime/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/consultant_profile_model.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ProfileController extends GetxController {
  List languages = ["English", "French", "Arabic"];
  List gender = const ["Male", "Female", "Other"];

  String selectedLanguage = "English";
  String? image;

  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ConsultantProfileModel userProfile = ConsultantProfileModel.fromJson({});

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
    update();
    Get.back();
  }

  getProfileRepo() async {
    var response = await ApiService.getApi(AppUrls.consultantProfile);
    if (response.statusCode == 200) {
      userProfile = ConsultantProfileModel.fromJson(jsonDecode(response.body));
      setValue();
    }
  }

  setValue() {
    nameController.text = userProfile.data.attributes.fullName;
    numberController.text = userProfile.data.attributes.phoneNumber;
    genderController.text = userProfile.data.attributes.gender;
    descriptionController.text = userProfile.data.attributes.aboutMe;
  }

  updateProfile(type) async {
    isLoading = true;
    update();
    var body = {
      "fullName": nameController.text,
      "phoneNumber": numberController.text,
      "gender": genderController.text,
      "aboutMe": aboutController.text
    };

    var response = await ApiService.signUpMultipartRequest(
        url: AppUrls.user,
        body: {
          "data": jsonEncode(body),
        },
        method: "PUT",
        imagePath: image,
        otp: '');

    if (response.statusCode == 200) {
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    getProfileRepo();
    super.onInit();
  }
}
