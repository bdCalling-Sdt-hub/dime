import 'package:dime/services/api_service.dart';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';
import '../../../utils/app_utils.dart';

class PeigoPaymentController extends GetxController {
  bool isLoading = false;

  String consultant = '';
  String appointment = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  static PeigoPaymentController get instance =>
      Get.put(PeigoPaymentController());



  paymentRequestsRepo() async {
    isLoading = true;
    update();

    var body = {
      "appointment": appointment,
      "consultant": consultant,
      "amount": amountController.text,
      "username": nameController.text,
      "phoneNumber": numberController.text,
      "email": emailController.text
    };

    var response = await ApiService.postApi(AppUrls.peigoRequests, body);
    isLoading = false;
    update();

    if (response.statusCode == 200) {
      Utils.toastMessage(response.message);
      Get.offAllNamed(AppRoutes.patientsHome);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

}
