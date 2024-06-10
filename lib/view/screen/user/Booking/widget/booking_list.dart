import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../controllers/user/Booking/my_booking_controller.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../models/api_response_model.dart';
import '../../../../../utils/app_images.dart';
import '../../../../common_widgets/custom_loader.dart';
import '../../../../common_widgets/doctor/doctor_book_item.dart';
import '../../../../common_widgets/error_screen.dart';
import '../../../../common_widgets/no_data.dart';

class BookingList extends StatelessWidget {
  const BookingList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyBookingController>(
      builder: (controller) => switch (controller.status) {
        Status.loading => const CustomLoader(),
        Status.error => ErrorScreen(
            onTap: () => controller.getAppointmentsRepo(),
          ),
        Status.completed => controller.appointmentList.isEmpty
            ? const NoData()
            : ListView.builder(
                itemCount: controller.appointmentList.length,
                itemBuilder: (context, index) {
                  var item = controller.appointmentList[index];
                  return DoctorBookItem(
                    date: DateFormat('MMMM d').format(item.appointmentTime),
                    time:
                        "${controller.time(item.appointmentTime)} - ${controller.time(item.appointmentTime, duration: item.duration)}",
                    image: AppImages.doctorSarah,
                    rightButtonText: "View Details".tr,
                    rightOnTap: () => Get.toNamed(AppRoutes.bookingDetails),
                    name: item.consultant.fullName,
                  );
                },
              ),
      },
    );
  }
}
