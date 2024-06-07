import 'dart:collection';
import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:dime/models/consultant_details.dart';
import 'package:get/get.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ConsultantDetailsController extends GetxController {
  ConsultantDetailsModel consultantDetailsModel = ConsultantDetailsModel();

  Status status = Status.completed;

  getConsultantDetailsRepo(String id) async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi("${AppUrls.consultantDetails}/$id");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data']['attributes'] ?? {};

      if (data.isNotEmpty) {
        consultantDetailsModel = ConsultantDetailsModel.fromJson(data);
      }
      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  String calculateTime(int totalMinutes) {
    int hours = totalMinutes ~/ 60; // integer division
    int remainingMinutes = totalMinutes % 60;
    int days = hours ~/ 24;

    if (days > 0) {
      return "$days day";
    } else if (hours > 0) {
      return "$hours hour";
    } else {
      return "$remainingMinutes minute";
    }
  }
}
