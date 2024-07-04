import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payphone/payphone.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  final int amount = 100;

  final int tax = 12;

  final String clientTransactionId = "1213456789";
  final String currency = "USD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: PayphoneWidget(
            width: Get.width,
            height: Get.height,
            token: "token",
            success: () {},
            cancelled: () {},
            amount: amount,
            tax: tax,
            amountWithTax: amount + tax,
            clientTransactionId: clientTransactionId,
            currency: currency,
            reference: "123456789"));
  }
}
