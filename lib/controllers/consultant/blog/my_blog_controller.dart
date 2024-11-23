import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:dime/models/my_blogs_model.dart';
import 'package:get/get.dart';

import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class MyBlogController extends GetxController {


  Status status = Status.completed;

  MyBlogsModel myBlogsModel = MyBlogsModel.fromJson({});

  static MyBlogController get instance => Get.put(MyBlogController());

  List blogs = [];
  int page = 1;

  getBlogsRepo() async {
    if (page == 1) {
      blogs.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(AppUrls.blog);

    if (response.statusCode == 200) {
      myBlogsModel = MyBlogsModel.fromJson(jsonDecode(response.body));

      blogs.addAll(myBlogsModel.data.attributes.blogsList);

      status = Status.completed;
      update();
      page++;
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
