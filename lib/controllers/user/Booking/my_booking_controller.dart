import 'dart:convert';
import 'package:dime/models/api_response_model.dart';
import 'package:dime/models/my_booking_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class MyBookingController extends GetxController {
  late TabController tabController;
  Status status = Status.completed;

  List statusList = [
    "pending",
    "payment",
    "payment-status",
    "upcoming",
    "completed"
  ];

  static MyBookingController get instance => Get.put(MyBookingController());

  selectTab(value) {
    if (kDebugMode) {
      print(value);
    }
  }

  // paymentInfo(BuildContext context, Appointment item) async {
  //   var data = await Navigator.of(context).push(MaterialPageRoute(
  //       builder: (BuildContext context) =>
  //           PaymentController.instance.paymentPaypal(amount: {
  //             "total": item.amount,
  //             "currency": "USD",
  //             "details": {
  //               "subtotal": item.amount,
  //               "shipping": '0',
  //               "shipping_discount": '0'
  //             },
  //           }, items: [
  //             {
  //               "name": item.type,
  //               "quantity": 1,
  //               "price": item.amount,
  //               "currency": "USD"
  //             },
  //           ])));
  //
  //   print('payment data : $data');
  // }

  late MyAppointmentModel myBookingModel;
  List appointmentList = [];

  int page = 1;

  getAppointmentsRepo() async {
    if (status == Status.loading) return;
    if (page == 1) {
      appointmentList.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
        "${AppUrls.appointments}?status=${statusList[tabController.index]}&page=$page");
    if (response.statusCode == 200) {
      myBookingModel = MyAppointmentModel.fromJson(jsonDecode(response.body));

      if (myBookingModel.data.attributes.appointmentList.isNotEmpty) {
        appointmentList.addAll(myBookingModel.data.attributes.appointmentList);
      }

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  time(DateTime datetime, {int duration = 0}) {
    datetime = datetime.add(Duration(minutes: duration));
    return "${datetime.hour} : ${datetime.minute}";
  }
}
