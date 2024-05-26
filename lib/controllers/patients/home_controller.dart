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
      "screen": AppRoutes.labBooking
    },
    {
      "name": "Business".tr,
      "image": Icons.medication,
      "screen": AppRoutes.ambulanceBooking
    },
    {
      "name": "Spots".tr,
      "image": Icons.agriculture,
      "screen": AppRoutes.homeCare
    },
    {
      "name": "Beauty".tr,
      "image": Icons.health_and_safety,
      "screen": AppRoutes.homeCare
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
      "rating": 4.7
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7
    },
    {
      "name": "Katryn Murphy".tr,
      "image": AppImages.katryn,
      "categories": "Cardiologist",
      "rating": 4.7
    },
  ];
}
