import 'dart:convert';

import 'package:dime/services/api_service.dart';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawController extends GetxController {
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController cedulaNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();

  withdrawRequestsRepo() async {
    isLoading = true;
    update();

    var body = {
      "amount": amountController.text,
      "paymentGateway": "Bank",
      "bankInfo": {
        "bankName": bankNameController.text,
        "accountNumber": accountNumberController.text,
        "accountName": nameController.text,
        "accountType": accountTypeController.text,
        "cedulaNumber": cedulaNumberController.text
      }
    };

    var response = await ApiService.postApi(AppUrls.withdrawRequests, jsonEncode(body));
 

    if (response.statusCode == 200) {
     Get.back();
    }
  }
}
