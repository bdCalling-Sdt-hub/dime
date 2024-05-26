import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PersonalInformationController extends GetxController {


  List gender = const ["Male", "Female", "Other"];
  List doctorType = const ["Medical", "Dental", "Veterinary"];
  List titleList = const ["Dr", "Prof Dr", "Assoc. Prof. Dr", "Asst.Prof. Dr"];
  List homeCareService = const ["Yes", "No"];



  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController homeServiceController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateOfBrithController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController identifierNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController doctorTypeController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();

  selectedDoctorType(int index) {
    doctorTypeController.text = doctorType[index].toString();
    update();
    Get.back();
  }


  selectedHomeService(int index) {
    homeServiceController.text = homeCareService[index].toString();
    update();
    Get.back();
  }


  selectedTitle(int index) {
    titleController.text = titleList[index].toString();
    update();
    Get.back();
  }
  selectedGender(int index) {
    genderController.text = gender[index].toString();
    update();
    Get.back();
  }
}
