import 'package:dime/core/app_routes.dart';
import 'package:dime/extension/my_extension.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/user/Booking/booking_details_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  String id = Get.parameters['id'] ?? "";

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => BookingDetailsController.instance.getAppointmentDetailsRepo(id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "User Booking Details".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<BookingDetailsController>(
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Subject'.tr,
                fontSize: 18.sp,
                top: 20.h,
                bottom: 4.h,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: controller.appointmentDetails.data.attributes.subject,
                fontWeight: FontWeight.w400,
              ),

              CustomText(
                text: 'Details'.tr,
                fontSize: 18.sp,
                top: 20.h,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: controller.appointmentDetails.data.attributes.description,
                fontWeight: FontWeight.w400,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),

              CustomText(
                text: 'Type'.tr,
                fontSize: 18.sp,
                top: 20.h,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: controller.appointmentDetails.data.attributes.type,
                fontWeight: FontWeight.w400,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),

              CustomText(
                text: 'Amount'.tr,
                fontSize: 18.sp,
                top: 20.h,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text:
                    "\$${controller.appointmentDetails.data.attributes.amount}",
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),

              controller.appointmentDetails.data.attributes.type == 'meeting'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Call Duration".tr,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                        SizedBox(
                          width: 150.w,
                          child: CustomTextField(
                            controller: controller.callDurationController,
                            fillColor: AppColors.black,
                            textAlign: TextAlign.center,
                            hindText: 'Call Duration'.tr,
                            textStyle: const TextStyle(color: AppColors.white),
                            isEnabled: false,
                          ),
                        )
                      ],
                    )
                  : 0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CustomText(
                          text: "Booking Date".tr,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          top: 40.h,
                          bottom: 12.h,
                        ),
                        CustomTextField(
                          controller: controller.bookingDateController,
                          fillColor: AppColors.transparent,
                          hindText: 'Booking Date'.tr,
                          fieldBorderRadius: 6.r,
                          isEnabled: false,
                          fieldBorderColor: AppColors.secondPrimary,
                          suffixIcon: const Icon(Icons.date_range),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Booking Time".tr,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          top: 40.h,
                          bottom: 12.h,
                        ),
                        CustomTextField(
                          controller: controller.bookingTimeController,
                          fillColor: AppColors.transparent,
                          hindText: 'Booking Time'.tr,
                          fieldBorderRadius: 6.r,
                          fieldBorderColor: AppColors.secondPrimary,
                          isEnabled: false,
                          suffixIcon: const Icon(Icons.access_time),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              // CustomButton(
              //   titleText: "Join".tr,
              //   titleSize: 24.sp,
              //   onTap: () => Get.toNamed(AppRoutes.videoCall),
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 9,
      ),
    );
  }
}
