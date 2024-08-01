import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';
import '../../../helpers/other_helper.dart';
import 'package:intl/intl.dart';

import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';

class BookAppointmentController extends GetxController {
  List relatives = const ["My Self", "Father", "Mother", "Brother", "Sister"];
  List gender = const ["Male", "Female", "Other"];
  List selectHourOption = const [
    "9:00 AM",
    "9:30 AM",
    "10.00 AM",
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
  bool isLoading = false;

  String selectedData = "";
  String selectedTime = "";
  String id = "";
  String amount = "";

  List availability = [];

  String? image;

  static BookAppointmentController get instance =>
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

  setAvailability(List data) {
    if (!data.any(
      (element) => element['day'] == 'Sat',
    )) {
      availability.add(DateTime.saturday);
    } else if (!data.any((element) => element['day'] == "Sun")) {
      availability.add(DateTime.sunday);
    } else if (!data.any((element) => element['day'] == "Mon")) {
      availability.add(DateTime.monday);
    } else if (!data.any((element) => element['day'] == "Tue")) {
      availability.add(DateTime.tuesday);
    } else if (!data.any((element) => element['day'] == "Wed")) {
      availability.add(DateTime.wednesday);
    } else if (!data.any((element) => element['day'] == "Thu")) {
      availability.add(DateTime.thursday);
    } else if (!data.any((element) => element['day'] == "Fri")) {
      availability.add(DateTime.friday);
    }
  }

  DateTime? getInitialDate(List data) {
    DateTime initialDate = DateTime.now();
    var sat = !data.any((element) => element['day'] == "Sat")
        ? DateTime.saturday
        : DateTime.september;
    var sun = !data.any((element) => element['day'] == "Sun")
        ? DateTime.sunday
        : DateTime.september;
    var mon = !data.any((element) => element['day'] == "Mon")
        ? DateTime.monday
        : DateTime.september;
    var tue = !data.any((element) => element['day'] == "Tue")
        ? DateTime.tuesday
        : DateTime.september;
    var wed = !data.any((element) => element['day'] == "Wed")
        ? DateTime.wednesday
        : DateTime.september;
    var thu = !data.any((element) => element['day'] == "Thu")
        ? DateTime.thursday
        : DateTime.september;
    var fri = !data.any((element) => element['day'] == "Fri")
        ? DateTime.friday
        : DateTime.september;

    while (initialDate.weekday == sat ||
        initialDate.weekday == sun ||
        initialDate.weekday == mon ||
        initialDate.weekday == tue ||
        initialDate.weekday == wed ||
        initialDate.weekday == thu ||
        initialDate.weekday == fri) {
      initialDate = initialDate.add(const Duration(days: 1));
    }
    return initialDate;
  }

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

  bool disableDay(DateTime date, List data) {
    var sat = !data.any((element) => element['day'] == "Sat")
        ? DateTime.saturday
        : DateTime.september;
    var sun = !data.any((element) => element['day'] == "Sun")
        ? DateTime.sunday
        : DateTime.september;
    var mon = !data.any((element) => element['day'] == "Mon")
        ? DateTime.monday
        : DateTime.september;
    var tue = !data.any((element) => element['day'] == "Tue")
        ? DateTime.tuesday
        : DateTime.september;
    var wed = !data.any((element) => element['day'] == "Wed")
        ? DateTime.wednesday
        : DateTime.september;
    var thu = !data.any((element) => element['day'] == "Thu")
        ? DateTime.thursday
        : DateTime.september;
    var fri = !data.any((element) => element['day'] == "Fri")
        ? DateTime.friday
        : DateTime.september;

    if (date.weekday == sat ||
        date.weekday == sun ||
        date.weekday == mon ||
        date.weekday == tue ||
        date.weekday == wed ||
        date.weekday == thu ||
        date.weekday == fri) {
      return false;
    }
    return true;
  }

  openImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  selectData(value) {
    final dateFormat = DateFormat('yyyy-MM-dd').format(value);
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

  bookAppointment() async {
    isLoading = true;
    update();

    int amountInt = int.tryParse(amount) ?? 1;
    int callTime = int.tryParse(callDurationController.text.split(" ")[0]) ?? 1;

    int totalAmount = amountInt * callTime;

    var body = {
      "appointmentDate": selectedData,
      "startTime": selectedTime,
      "consultant": id,
      "subject": subjectController.text,
      "description": descriptionController.text,
      "duration": callDurationController.text.split(" ")[0],
      "amount": totalAmount.toString(),
      "type": 'meeting'
    };

    var response = await ApiService.postApi(AppUrls.appointments, body);
    isLoading = false;
    update();

    if (response.statusCode == 200) {
      Get.toNamed(AppRoutes.myBooking, parameters: {"index": "0"});
    }
  }
}
