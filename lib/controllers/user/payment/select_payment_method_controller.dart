import 'package:get/get.dart';

class SelectPaymentMethodController extends GetxController {
  List selectedOption = ["Credit Card", "Paypal",];

  String selectRole = "Credit Card";



  setSelectedRole(value) {
    selectRole = value;
    update();
  }
}
