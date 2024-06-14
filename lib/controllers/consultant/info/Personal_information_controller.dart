import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';
import '../../../models/category_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class PersonalInformationController extends GetxController {
  Status serviceStatus = Status.completed;
  bool isLoading = false;

  List gender = const ["Male", "Female", "Other"];
  List doctorType = [];
  List dataList = [];
  List selectedCategory = [];
  List selectedCategoryId = [];
  List titleList = const ["Dr", "Prof Dr", "Assoc. Prof. Dr", "Asst.Prof. Dr"];

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController identifierNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  static PersonalInformationController get instance =>
      Get.put(PersonalInformationController());

  selectedDoctorType(int index) {
    if (!selectedCategory.contains(dataList[index].id)) {
      selectedCategory.add(dataList[index].name.toString());
      selectedCategoryId.add(dataList[index].id.toString());
    } else {
      selectedCategory.remove(dataList[index].id.toString());
      selectedCategoryId.remove(dataList[index].id.toString());
    }
    print(selectedCategory);
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

  getCategoryRepo() async {
    var response = await ApiService.getApi(AppUrls.category);

    if (response.statusCode == 200) {
      List data =
          jsonDecode(response.body)['data']['attributes']["categoryList"] ?? [];

      if (data.isNotEmpty) {
        for (var item in data) {
          var categoryModel = (CategoryModel.fromJson(item));
          dataList.add(categoryModel);
          doctorType.add(categoryModel.name);
        }
      }
      serviceStatus = Status.loading;
      update();
    } else {
      serviceStatus = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  updateProfile(type) async {
    isLoading = true;
    update();
    var body = {
      "title": titleController.text,
      "name": nameController.text,
      "number": numberController.text,
      "country": countryController.text,
      "gender": genderController.text,
      "category": selectedCategoryId,
      "aboutMe": aboutMeController.text
    };

    var response =
        await ApiService.putApi(AppUrls.user, {"data": jsonEncode(body)});

    if (response.statusCode == 200) {
      if (type == "back") {
        Get.back();
      } else {
        Get.toNamed(AppRoutes.availability);
      }
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
