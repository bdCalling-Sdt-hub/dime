import 'dart:async';
import 'dart:convert';

import 'package:dime/utils/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/app_routes.dart';
import '../../services/api_service.dart';
import '../../utils/app_utils.dart';

class ForgetPasswordController extends GetxController {
  bool isLoadingEmail = false;

  bool isLoadingVerify = false;

  bool isLoadingReset = false;

  String forgetPasswordToken = '';

  int start = 0;
  Timer? _timer;

  String time = "00:00";

  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    startTimer();
    super.dispose();
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    start = 180; // Reset the start value
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
        final minutes = (start ~/ 60).toString().padLeft(2, '0');
        final seconds = (start % 60).toString().padLeft(2, '0');

        time = "$minutes:$seconds";

        update();
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<void> forgotPasswordRepo() async {
    isLoadingEmail = true;
    update();

    Map<String, String> body = {
      "email": emailController.text,
    };
    var response = await ApiService.postApi(AppUrls.forgotPassword, body);

    if (response.statusCode == 200) {
      Utils.toastMessage(response.message);
      Get.toNamed(AppRoutes.verifyEmail);
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }
    isLoadingEmail = false;
    update();
  }

  ///<<<===================Verify Password Repo==============================>>>

  Future<void> verifyOtpRepo() async {
    isLoadingVerify = true;
    update();
    Map<String, String> body = {
      "email": emailController.text,
      "otp": otpController.text
    };
    var response = await ApiService.postApi(
      AppUrls.verifyOtp,
      body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      forgetPasswordToken = data['data']['forgetPasswordToken'];
      Get.toNamed(AppRoutes.createPassword);
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoadingVerify = false;
    update();
  }

  ///<<<===================Verify Password Repo==============================>>>

  Future<void> resetPasswordRepo() async {
    isLoadingReset = true;
    update();
    Map<String, String> header = {
      "Forget-password": "Forget-password $forgetPasswordToken",
    };

    Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text
    };
    var response =
        await ApiService.postApi(AppUrls.resetPassword, body, header: header);

    if (response.statusCode == 200) {
      Utils.toastMessage(response.message);
      Get.offAllNamed(AppRoutes.signIn);

      emailController.clear();
      otpController.clear();
      numberController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    } else if (response.statusCode == 400) {
      Utils.toastMessage(response.message);
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }
    isLoadingReset = false;
    update();
  }
}
