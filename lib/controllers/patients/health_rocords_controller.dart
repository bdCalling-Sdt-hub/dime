import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../helpers/other_helper.dart';

class HealthRecordController extends GetxController {
  String? image;

  TextEditingController descriptionController = TextEditingController();

  openImage() async {
    image = await OtherHelper.openGallery();
    update();
  }
}
