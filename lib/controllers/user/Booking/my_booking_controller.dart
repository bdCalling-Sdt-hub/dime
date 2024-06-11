import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingController extends GetxController {
  late TabController tabController;

  static MyBookingController get instance => Get.put(MyBookingController());

  selectTab(value) {
    if (kDebugMode) {
      print(value);
    }
  }
}
