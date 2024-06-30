import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LabBookingController extends GetxController {
  List categories = const [
    "All",
    "Blood Test",
    "Urine Test",
    "Pi Test",
    "Ophthalmology",
  ];


  String selectedData = "";

  TextEditingController searchController = TextEditingController();

  selectData(value) {
    final dateFormat = DateFormat('MMMM d, yyyy').format(value);
    selectedData = dateFormat.toString();
  }


}
