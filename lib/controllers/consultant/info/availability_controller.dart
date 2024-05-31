import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AvailabilityController extends GetxController {
  List week = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];

  List selectedWeekList = [];

  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  selectWeek(int index) {
    String selectedWeek = week[index].toString();
    if (!selectedWeekList.contains(selectedWeek)) {
      selectedWeekList.add(selectedWeek);
      update();
    }
  }
}
