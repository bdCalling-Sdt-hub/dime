import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PatientsDetailsController extends GetxController {
  TextEditingController callDurationController =
      TextEditingController(text: '45 min');
  TextEditingController bookingDateController =
      TextEditingController(text: '12-04-2024');
  TextEditingController bookingTimeController =
      TextEditingController(text: '12:30 PM');
}
