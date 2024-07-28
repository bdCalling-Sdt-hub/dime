import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'payment_controller.dart';

class SelectPaymentMethodController extends GetxController {
  bool isLoading = false;

  List selectedOption = [
    "Bank Transfer",
    "Pei-go",
    "Paypal",
  ];
  String selectRole = "Bank Transfer";

  String amount = '';
  String productName = '';
  dynamic paymentInfo = {};

  static SelectPaymentMethodController get instance =>
      Get.put(SelectPaymentMethodController());

  setSelectedRole(value) {
    selectRole = value;
    update();
  }

  paymentPayPal(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            PaymentController.instance.paymentPaypal(amount: {
              "total": amount,
              "currency": "USD",
              "details": {
                "subtotal": amount,
                "shipping": '0',
                "shipping_discount": '0'
              },
            }, items: [
              {
                "name": productName,
                "quantity": 1,
                "price": amount,
                "currency": "USD"
              },
            ])));
  }
}
