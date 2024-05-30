import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/doctor/appointment_history_controller.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'appointment_history_item.dart';

class AppointmentHistoryScreen extends StatelessWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Appointment History".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<AppointmentHistoryController>(
        builder: (controller) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            itemCount: 6,
            itemBuilder: (context, index) {
              return AppointmentHistoryItem(
                time: "Fri, 11:30 am",
                title: "Appointment with Annette Black",
                startEndTime: "11:30 am to 12:30 pm",
                disableDivider: 5 == index ? true : false,
              );
            },
          );
        },
      ),
    );
  }
}
