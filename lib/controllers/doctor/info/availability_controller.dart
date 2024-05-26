import 'package:get/get.dart';

class AvailabilityController extends GetxController {
  List week = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
  List hours = [
    "9:00 AM",
    "9:30 AM",
    "10:00 AM",
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

  List selectedWeekList = [];
  List selectedHourList = [];

  selectWeek(int index) {
    String selectedWeek = week[index].toString();
    if (!selectedWeekList.contains(selectedWeek)) {
      selectedWeekList.add(selectedWeek);
      update();
    }
  }

  selectHour(int index) {
    String selectedHour = hours[index].toString();
    if (!selectedHourList.contains(selectedHour)) {
      selectedHourList.add(selectedHour);
      update();
    }
  }
}
