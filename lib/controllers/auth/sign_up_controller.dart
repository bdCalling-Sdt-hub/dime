import 'dart:async';
import 'dart:convert';

import 'package:dime/core/app_routes.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:dime/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';

import '../../helpers/prefs_helper.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';

class SignUpController extends GetxController {
  bool isPopUpOpen = false;
  bool isLoading = false;
  bool isLoadingVerify = false;

  Timer? _timer;
  int start = 0;

  String time = "";

  List selectedOption = ["User", "Consultant"];

  String selectRole = "User";
  String countryCode = "+880";
  String? image;

  String signUpToken = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController governmentIdController = TextEditingController();
  TextEditingController otpController = TextEditingController();


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  onCountryChange(Country value) {
    countryCode = value.dialCode.toString();
  }

  setSelectedRole(value) {
    selectRole = value;
    update();
  }

  openGallery() async {
    image = await OtherHelper.openGallery();
    update();
  }

  signUpUser() async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "fullName": nameController.text,
      "email": emailController.text,
      "phoneNumber": numberController.text,
      "countryCode": countryCode,
      "password": passwordController.text,
      "role": selectRole.toLowerCase()
    };

    var response = await ApiService.postApi(
      AppUrls.signUp,
      body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      signUpToken = data['data']['signUpToken'];
      Get.toNamed(AppRoutes.verifyUser);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    start = 180; // Reset the start value
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
        final minutes = (start ~/ 60).toString().padLeft(2, '0');
        final seconds = (start % 60).toString().padLeft(2, '0');

        time = "$minutes:$seconds";

        print(timer);

        update();
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<void> verifyOtpRepo() async {
    isLoadingVerify = true;
    update();
    Map<String, String> body = {"otp": otpController.text};
    Map<String, String> header = {"SignUpToken": "signUpToken $signUpToken"};
    var response =
        await ApiService.postApi(AppUrls.verifyEmail, body, header: header);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      PrefsHelper.token = data['data']["accessToken"];
      PrefsHelper.userId = data['data']["attributes"]["_id"];
      PrefsHelper.myImage = data['data']["attributes"]["image"];
      PrefsHelper.myName = data['data']["attributes"]["fullName"];
      PrefsHelper.myRole = data['data']["attributes"]["role"];
      PrefsHelper.myEmail = data['data']["attributes"]["email"];
      PrefsHelper.isLogIn = false;

      PrefsHelper.setString('token', PrefsHelper.token);
      PrefsHelper.setString("userId", PrefsHelper.token);
      PrefsHelper.setString("myImage", PrefsHelper.token);
      PrefsHelper.setString("myName", PrefsHelper.token);
      PrefsHelper.setString("myEmail", PrefsHelper.token);
      PrefsHelper.setString("myRole", PrefsHelper.myRole);
      PrefsHelper.setBool("isLogIn", false);

      if (PrefsHelper.myRole == 'consultant') {
        Get.offAllNamed(AppRoutes.doctorHome);
      } else {
        Get.offAllNamed(AppRoutes.patientsHome);
      }
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoadingVerify = false;
    update();
  }
}
