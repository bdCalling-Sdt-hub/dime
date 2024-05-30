import 'package:dime/core/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  bool paymentSuccess = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvNumberController = TextEditingController();

  setPayment(bool value) {
    paymentSuccess = value;
    update();
  }

  closePayment() {
    Get.offAllNamed(AppRoutes.patientsHome);
  }
}
