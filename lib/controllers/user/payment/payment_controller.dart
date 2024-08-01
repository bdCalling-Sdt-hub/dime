import 'dart:math';

import 'package:dime/services/api_service.dart';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';
import '../../../helpers/prefs_helper.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/payment_key.dart';

class PaymentController extends GetxController {
  bool isLoading = false;

  String consultant = '';
  String appointment = '';

  TextEditingController referenceCodeController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  static PaymentController get instance => Get.put(PaymentController());

  paymentPaypal(
      {required Map amount,
      required List items,
      String description = 'The payment transaction'}) {
    /* {
      "amount": {
    "total": "100",
    "currency": "USD",
    "details": {
    "subtotal": "100",
    "shipping": '0',
    "shipping_discount": '0'
  }
  },
    "description": "The payment transaction description.",
    "item_list": {
    "items": [
  {
    "name": "Apple",
    "quantity": 1,
    "price": "100",
    "currency": "USD"
  },
    ],
  }
  }*/
    return PaypalCheckoutView(
      sandboxMode: true,
      clientId: clientId,
      secretKey: secretKey,
      transactions: [
        {
          "amount": amount,
          "description": "The payment transaction description.",
          "item_list": {
            "items": items,
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        await paymentDataRepo(params['data']['id']);
        if (kDebugMode) {
          print("onSuccess: $params");
        }
      },
      onError: (error) {
        Navigator.pop(Get.context!);
        Get.snackbar("Something went wrong,", "Try again!");
        if (kDebugMode) {
          print("onError: $error");
        }
      },
      onCancel: () {
        Navigator.pop(Get.context!);
        Get.snackbar("Payment cancelled", "");
        if (kDebugMode) {
          print('cancelled:');
        }
      },
    );
  }

  paymentRequestsRepo() async {
    isLoading = true;
    update();

    var body = {
      "appointment": appointment,
      "consultant": consultant,
      "amount": amountController.text,
      "referenceKey": referenceCodeController.text,
      "reverifyAttempts": '1'
    };

    var response = await ApiService.postApi(AppUrls.paymentRequests, body);
    isLoading = false;
    update();

    if (response.statusCode == 200) {
      Utils.toastMessage(response.message);
      Get.offAllNamed(AppRoutes.patientsHome);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  String referenceCode() {
    const String possibleCharacters = 'abcdefghijklmnopqrstuvwxyz1234567890';
    String output = '';
    Random random = Random();
    for (int i = 0; i < 7; i++) {
      int randomIndex = random.nextInt(possibleCharacters.length);
      String randomCharacter = possibleCharacters[randomIndex];
      output += randomCharacter;
    }
    return output ;
  }

  paymentDataRepo(paymentId) async {
    isLoading = true;
    update();
    var body = {
      "paymentId": paymentId,
      "amount": amountController.text,
      "user": PrefsHelper.userId,
      "consultant": consultant,
      "appointment": appointment
    };

    var response = await ApiService.postApi(AppUrls.paymentData, body);
    if (response.statusCode == 200) {
      Utils.toastMessage(response.message);
      Get.offAllNamed(AppRoutes.patientsHome);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
