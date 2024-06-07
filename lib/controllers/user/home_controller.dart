import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:dime/models/category_model.dart';
import 'package:dime/services/api_service.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/utils/app_utils.dart';
import 'package:get/get.dart';
import '../../models/consultantListModel.dart';

class HomeControllerPatients extends GetxController {
  List categories = [];

  List doctors = [];

  Status serviceStatus = Status.completed;

  getServicesRepo() async {
    serviceStatus = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.category);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['attributes'] ?? [];

      if (data.isNotEmpty) {
        for (var item in data) {
          categories.add(CategoryModel.fromJson(item));
        }
      }
      serviceStatus = Status.loading;
      update();
    } else {
      serviceStatus = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  getTopAdvisorRepo() async {
    serviceStatus = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.consultantList);

    if (response.statusCode == 200) {
      List data =
          jsonDecode(response.body)['data']['attributes']['userList'] ?? [];

      if (data.isNotEmpty) {
        for (var item in data) {
          doctors.add(ConsultantListModel.fromJson(item));
        }
      }
      serviceStatus = Status.loading;
      update();
    } else {
      serviceStatus = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  @override
  void onInit() {
    getServicesRepo();
    getTopAdvisorRepo();
    super.onInit();
  }
}
