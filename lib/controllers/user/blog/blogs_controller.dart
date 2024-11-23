import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:dime/models/blogs_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class BlogsController extends GetxController {
  String selectedCategory = "All";
  String categoryId = "";

  Status status = Status.completed;

  BlogsModel blogsModel = BlogsModel.fromJson({});

  bool isLoading = false;
  bool isMoreLoading = false;
  List blogs = [];

  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  selectCategory(String value) {
    selectedCategory = value;
    update();
  }

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await getBlogsRepo();
      isMoreLoading = false;
      update();
    }
  }

  int page = 1;

  getBlogsRepo() async {
    if (page == 1) {
      blogs.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
        "${AppUrls.blogs}?category=$categoryId&search=${searchController.text}");

    if (response.statusCode == 200) {
      blogsModel = BlogsModel.fromJson(jsonDecode(response.body));

      blogs.addAll(blogsModel.data.attributes.blogsList);

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
