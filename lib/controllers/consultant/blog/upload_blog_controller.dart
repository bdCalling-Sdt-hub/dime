import 'package:dime/helpers/other_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UploadBlogController extends GetxController {
  List categories = ["Medical", "Economics", "Business", "Business"];

  String? image;

  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  getImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  selectCategory(int index) {
    categoryController.text = categories[index].toString();
    update();
    Get.back();
  }
}
