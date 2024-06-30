import 'dart:convert';
import 'package:dime/models/api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../models/consultant_list_model.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class CategoryListController extends GetxController {
  String selectedCategory = 'All';
  String categoryId = '';
  bool isLoading = false;
  Status status = Status.completed;

  List doctors = [];
  int page = 1;
  bool isMoreLoading = false;

  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  selectCategory(String category, String id) {
    selectedCategory = category;
    categoryId = id;
    searchController.clear();
    update();

    page = 1;
    getConsultantsRepo();
  }

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await getConsultantsRepo();
      isMoreLoading = false;
      update();
    }
  }

  getConsultantsRepo() async {
    if (page == 1) {
      doctors.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
        "${AppUrls.consultantList}?category=$categoryId&search=${searchController.text}");

    if (response.statusCode == 200) {
      List data =
          jsonDecode(response.body)['data']['attributes']['userList'] ?? [];

      if (data.isNotEmpty) {
        for (var item in data) {
          doctors.add(ConsultantListModel.fromJson(item));
        }
      }
      page++;
      status = Status.loading;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
