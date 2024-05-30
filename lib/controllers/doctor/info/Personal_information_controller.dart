import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PersonalInformationController extends GetxController {
  List gender = const ["Male", "Female", "Other"];
  List doctorType = const ["Economics", "Business", "Spots", 'Beauty'];
  List titleList = const ["Dr", "Prof Dr", "Assoc. Prof. Dr", "Asst.Prof. Dr"];

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateOfBrithController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController identifierNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController consultantTypeController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  selectedDoctorType(int index) {
    consultantTypeController.text = doctorType[index].toString();
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
