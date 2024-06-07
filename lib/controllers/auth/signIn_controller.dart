import 'dart:convert';

import 'package:dime/utils/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/app_routes.dart';
import '../../helpers/prefs_helper.dart';
import '../../services/api_service.dart';

class SignInController extends GetxController {
  bool isLoading = false;

  TextEditingController emailController =
      TextEditingController(text: kDebugMode ? 'dijogil285@avastu.com' : '');
  TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? 'hello123' : "");

  Future<void> signInUser() async {

    Get.offAllNamed(AppRoutes.doctorHome);
    return ;
    isLoading = true;
    update();

    Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var response = await ApiService.postApi(
      AppUrls.signIn,
      body,
    ).timeout(const Duration(seconds: 30));

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

      emailController.clear();
      passwordController.clear();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
