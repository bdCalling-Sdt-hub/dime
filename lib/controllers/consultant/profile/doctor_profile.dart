import 'dart:convert';

import 'package:dime/controllers/consultant/info/personal_information_controller.dart';
import 'package:dime/controllers/consultant/info/availability_controller.dart';
import 'package:dime/models/consultant_profile_model.dart';
import 'package:dime/services/api_service.dart';
import 'package:dime/utils/app_url.dart';
import 'package:get/get.dart';

class DoctorProfileController extends GetxController {
  List info = [
    "Personal Information",
    "Professional Qualification",
    "Experience Details",
    "Availability"
  ];

  String selectedInfo = "";

  ConsultantProfileModel consultantProfile =
      ConsultantProfileModel.fromJson({});





  getProfileRepo() async {
    var response = await ApiService.getApi(AppUrls.consultantProfile);
    if (response.statusCode == 200) {
      consultantProfile =
          ConsultantProfileModel.fromJson(jsonDecode(response.body));
      setValue();
    }
  }

  setValue() {
    PersonalInformationController.instance.titleController.text =
        consultantProfile.data.attributes.title;
    PersonalInformationController.instance.nameController.text =
        consultantProfile.data.attributes.fullName;
    PersonalInformationController.instance.numberController.text =
        consultantProfile.data.attributes.phoneNumber;
    PersonalInformationController.instance.countryController.text =
        consultantProfile.data.attributes.country;
    PersonalInformationController.instance.genderController.text =
        consultantProfile.data.attributes.gender;
    PersonalInformationController.instance.aboutMeController.text =
        consultantProfile.data.attributes.aboutMe;

    AvailabilityController.instance.videoConferenceFeeController.text =
        consultantProfile.data.attributes.videoConferenceFee.toString();
    AvailabilityController.instance.videoReplyFeeController.text =
        consultantProfile.data.attributes.videoReplyFee.toString();

    for (var item in consultantProfile.data.attributes.availability) {
      AvailabilityController.instance.selectedWeekList.add({
        'day': item.day,
        'startTime': item.startTime,
        'endTime': item.endTime
      });
    }
  }

  @override
  void onInit() {
    getProfileRepo();
    super.onInit();
  }
}
