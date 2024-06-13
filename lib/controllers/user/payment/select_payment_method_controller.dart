import 'package:get/get.dart';

class SelectPaymentMethodController extends GetxController {
  List selectedOption = [
    "Bank Transfer",
    "Credit Card",
    "Paypal",
  ];

  String selectRole = "Bank Transfer";

  setSelectedRole(value) {
    selectRole = value;
    update();
  }
}
