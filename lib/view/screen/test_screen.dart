
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payphone/payphone.dart';

class TestScreen extends StatelessWidget {
   TestScreen({super.key});

  int amount = 100 ;
  int tax = 12 ;
  String clientTransactionId= "1213456789";
  String currency = "USD" ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: PayphoneWidget(
            width: Get.width,
            height: Get.height,
            token: "token",
            success: () => print("success"),
            cancelled: () => print("cancelled"),
            amount: amount,
            tax: tax,
            amountWithTax: amount+ tax,
            clientTransactionId: clientTransactionId,
            currency: currency,
            reference: "123456789"))
      );
    }
  }
