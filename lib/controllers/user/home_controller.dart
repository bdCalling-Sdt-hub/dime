import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:dime/models/category_model.dart';
import 'package:dime/services/api_service.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/consultant_list_model.dart';

class HomeControllerPatients extends GetxController {
  List categories = [];

  List doctors = [];
  bool isMoreLoading = false;

  Status serviceStatus = Status.completed;
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  static HomeControllerPatients get instance =>
      Get.put(HomeControllerPatients());

  int page = 1;

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await getTopAdvisorRepo();
      isMoreLoading = false;
      update();
    }
  }

  getServicesRepo() async {
    serviceStatus = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.category);

    if (response.statusCode == 200) {
      List data =
          jsonDecode(response.body)['data']['attributes']["categoryList"] ?? [];

      if (data.isNotEmpty) {
        for (var item in data) {
          categories.add(CategoryModel.fromJson(item));
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

  getTopAdvisorRepo() async {
    if (page == 1) {
      doctors.clear();
      serviceStatus = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
        "${AppUrls.consultantList}?search=${searchController.text}");

    if (response.statusCode == 200) {
      List data =
          jsonDecode(response.body)['data']['attributes']['userList'] ?? [];

      if (data.isNotEmpty) {
        for (var item in data) {
          doctors.add(ConsultantListModel.fromJson(item));
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

  @override
  void onInit() {
    getServicesRepo();
    getTopAdvisorRepo();
    super.onInit();
  }
}
