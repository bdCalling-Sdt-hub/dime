import 'dart:convert';

import 'package:dime/extension/my_extension.dart';
import 'package:dime/models/api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';
import '../../../models/appintment_model.dart';
import '../../../services/api_service.dart';
import '../../../services/socket_service.dart';
import '../../../utils/app_url.dart';
import '../../../utils/app_utils.dart';

class BookingDetailsController extends GetxController {
  Status status = Status.completed;

  TextEditingController callDurationController = TextEditingController();
  TextEditingController bookingDateController = TextEditingController();
  TextEditingController bookingTimeController = TextEditingController();

  AppointmentDetails appointmentDetails = AppointmentDetails.fromJson({});

  static BookingDetailsController get instance =>
      Get.put(BookingDetailsController());

  getAppointmentDetailsRepo(String id) async {
    if (status == Status.loading) return;

    status = Status.loading;
    update();

    var response = await ApiService.getApi("${AppUrls.appointments}/$id");
    if (response.statusCode == 200) {
      appointmentDetails =
          AppointmentDetails.fromJson(jsonDecode(response.body));

      callDurationController.text =
          appointmentDetails.data.attributes.duration.toString();
      bookingDateController.text =
          appointmentDetails.data.attributes.appointmentTime.date;
      bookingTimeController.text =
          appointmentDetails.data.attributes.appointmentTime.time;

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  addChatRoom(String id) {
    var body = {"participant": id};

    print(body);
    SocketServices.socket.emitWithAck("add-new-chat", body, ack: (data) {
      if (data['status'] == "Success") {
        var user = data['user'] ?? {};
        Get.toNamed(AppRoutes.message, parameters: {
          "chatId": data['chatId'] ?? "",
          "name": user['fullName'] ?? "",
          "image": user['image'] ?? "",
          // "image": item.image,
        });
      }
    });
  }
}
