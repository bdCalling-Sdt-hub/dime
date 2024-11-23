import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:get/get.dart';

import '../../../models/recent_transaction_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class TransactionController extends GetxController {
  Status status = Status.completed;

  bool isLoading = false ;

  String amount = "0";

  static TransactionController get instance => Get.put(TransactionController());
  RecentTransactionModel recentTransactionModel =
      RecentTransactionModel.fromJson({});

  Future getBalanceRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.wallets);

    if (response.statusCode == 200) {
      amount = jsonDecode(response.body)['data']['attributes']
              ['amountAvailable']
          .toString();
      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future getRecentTransactionRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrls.withdrawRequests);

    if (response.statusCode == 200) {
      recentTransactionModel =
          RecentTransactionModel.fromJson(jsonDecode(response.body));

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  getRepo() async {
    isLoading = true ;
    update();
    await Future.wait([getBalanceRepo(), getRecentTransactionRepo()]);
    isLoading = false ;
    update();
  }
}
