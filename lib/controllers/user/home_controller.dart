import 'package:dime/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_routes.dart';
import '../../utils/app_images.dart';
import 'package:flutter/cupertino.dart';

class HomeControllerPatients extends GetxController {
  List services = [
    {
      "name": "Economics".tr,
      "image": Icons.payments_rounded,
      "type": '',
    },
    {
      "name": "Business".tr,
      "image": Icons.medication,
      "type": '',
    },
    {
      "name": "Spots".tr,
      "image": Icons.agriculture,
      "type": '',
    },
    {
      "name": "Beauty".tr,
      "image": AppIcons.beauty,
      "type": 'svg',
    },
  ];

  List doctors = [
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7,
      "chat": 4335,
      "price": 5000
    },
  ];
}
