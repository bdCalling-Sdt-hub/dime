import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:dime/models/html_model.dart';
import 'package:dime/services/api_service.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/utils/app_utils.dart';
import 'package:get/get.dart';

class PrivacyPolicyController extends GetxController {
  Status status = Status.completed;

  HtmlModel data = HtmlModel.fromJson({});

  static PrivacyPolicyController get instance =>
      Get.put(PrivacyPolicyController());

  getPrivacyPolicyRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.privacyPolicies);

    if (response.statusCode == 200) {
      data =
          HtmlModel.fromJson(jsonDecode(response.body)['data']['attributes']);

      status = Status.completed;
      update();
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
      status = Status.error;
      update();
    }
  }

  @override
  void onInit() {
    getPrivacyPolicyRepo();
    super.onInit();
  }
}
