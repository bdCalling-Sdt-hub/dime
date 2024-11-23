import 'dart:convert';

import 'package:dime/helpers/other_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/category_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class UploadBlogController extends GetxController {
  List categories = [];
  List categoriesListItem = [];

  String categoryId = "";

  String? image;
  String? imageNetwork;
  String? categoryIdNetwork;

  bool isLoading = false;

  static UploadBlogController get instance => Get.put(UploadBlogController());

  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  getImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  getCategoriesRepo() async {
    var response = await ApiService.getApi(AppUrls.category);

    if (response.statusCode == 200) {
      List data =
          jsonDecode(response.body)['data']['attributes']["categoryList"] ?? [];

      if (data.isNotEmpty) {
        for (var item in data) {
          categoriesListItem.add(CategoryModel.fromJson(item));
          categories.add(CategoryModel.fromJson(item).name);
        }
      }

      update();
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  selectCategory(int index) {
    categoryController.text = categoriesListItem[index].name.toString();
    categoryId = categoriesListItem[index].id.toString();
    update();
    Get.back();
  }

  Future<void> uploadBlogRepo() async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "title": titleController.text,
      "category": categoryId,
      "price": priceController.text,
      "details": detailsController.text
    };

    var response = await ApiService.multipartRequest(
        url: AppUrls.blog,
        body: body,
        files: [
          {"name": "image", "file": image}
        ]);

    if (response.statusCode == 200) {
      Get.back();
      titleController.clear();
      categoryController.clear();
      priceController.clear();
      detailsController.clear();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
