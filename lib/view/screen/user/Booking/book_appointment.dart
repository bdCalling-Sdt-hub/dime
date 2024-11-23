import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/Booking/book_appointment_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';

class BookingAppointmentScreen extends StatelessWidget {
  BookingAppointmentScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookAppointmentController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
              text: "Schedule a call".tr,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomText(
                    text: "Patients Relation with principle patient".tr,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    bottom: 12.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                      titleText: "Next".tr,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Get.toNamed(AppRoutes.bookAppointment);
                        }
                        Get.toNamed(AppRoutes.scheduleVideoCall);
                      }),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(
            currentIndex: 6,
          ),
        );
      },
    );
  }
}
