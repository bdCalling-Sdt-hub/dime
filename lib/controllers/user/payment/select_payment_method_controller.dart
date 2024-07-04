import 'package:dime/core/app_routes.dart';
import 'package:dime/helpers/prefs_helper.dart';
import 'package:dime/services/api_service.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'payment_controller.dart';

class SelectPaymentMethodController extends GetxController {
  bool isLoading = false;

  List selectedOption = [
    "Bank Transfer",
    "Credit Card",
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
    var paymentInfo = await Navigator.of(context).push(MaterialPageRoute(
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


    print('payment data : ${paymentInfo['data']['id']}');
  }


}
