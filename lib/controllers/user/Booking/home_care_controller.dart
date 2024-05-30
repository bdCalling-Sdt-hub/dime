import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeCareController extends GetxController {
  List selectHourOption = const [
    "9:00 AM",
    "9:30 AM",
    "10.00AP",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "3:00 PM",
    "3:30 PM",
    "4:00 PM",
    "4:30 PM",
    "5:00 PM",
    "5:30 PM"
  ];

  String selectedTime = "";

  TextEditingController searchController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  selectTime(int index) {
    selectedTime = selectHourOption[index].toString();
    update();
  }
}
