import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/other_helper.dart';
import 'package:intl/intl.dart';

class BookAppointmentController extends GetxController {
  List relatives = const ["My Self", "Father", "Mother", "Brother", "Sister"];
  List gender = const ["Male", "Female", "Other"];
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

  String selectedData = "";
  String selectedTime = "";
  String id = "";
  String amount = "";

  String? image;

  static BookAppointmentController instance =
      Get.put(BookAppointmentController());

  List callDurations = [
    '5 min',
    '10 min',
    '15 min',
    '20 min',
    '25 min',
    '30 min',
    '35 min',
    '40 min',
    '45 min',
    '50 min',
    '55 min',
    '60 min',
    '65 min',
    '70 min'
  ];

  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController bookingDateController = TextEditingController();
  TextEditingController bookingTimeController = TextEditingController();
  TextEditingController callDurationController = TextEditingController();

  Duration duration = const Duration(
    hours: 9,
  );

  selectCallDuration(int index) {
    callDurationController.text = callDurations[index].toString();
    update();
    Get.back();
  }

  DateTime getInitialDate() {
    DateTime initialDate = DateTime.now();
    while (initialDate.weekday == DateTime.saturday ||
        initialDate.weekday == DateTime.sunday) {
      initialDate = initialDate.add(const Duration(days: 1));
    }
    return initialDate;
  }

  openImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  bool disableDay(DateTime date) {
    // Disable Saturdays and Sundays
    if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
      return false;
    }
    return true;
  }

  selectData(value) {
    final dateFormat = DateFormat('MMMM d, yyyy').format(value);
    selectedData = dateFormat.toString();
  }

  String hour(int index) {
    Duration time = Duration(hours: duration.inHours, minutes: (index * 30));

    String period = time.inHours >= 12 ? 'PM' : 'AM';
    int hour = time.inHours % 12 == 0 ? 12 : time.inHours % 12;
    int minutes = time.inMinutes;
    minutes = minutes % 60;

    if (time.inHours >= 12 && hour <= 15) {
      duration = const Duration(hours: 11);
    }

    String minute = minutes.toString();
    if (minutes == 00) {
      minute = "00";
    }

    return "$hour:$minute $period";
  }

  selectTime(int index) {
    selectedTime = selectHourOption[index].toString();
    update();
  }
}
