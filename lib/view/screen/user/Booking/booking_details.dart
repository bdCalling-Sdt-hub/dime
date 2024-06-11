import 'package:dime/core/app_routes.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/user/Booking/Booking_details_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

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
                text: 'Hydrate, avoid triggers, magnesium',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              CustomText(
                text: 'Details'.tr,
                fontSize: 18.sp,
                top: 20.h,
                bottom: 4.h,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text:
                    'I,m sorry to hear about your migraines. Alongside medication, consider dietary adjustments like staying hydrated, avoiding trigger foods like aged cheese, processed meats, and alcohol, and incorporating magnesium-rich foods like nuts, seeds, and leafy greens. Consult a healthcare professional for personalized advice',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                maxLines: 5,
                bottom: 40.h,
                textAlign: TextAlign.start,
              ),
              Row(
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
              ),
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
              CustomButton(
                titleText: "Join".tr,
                titleSize: 24.sp,
                onTap: () => Get.toNamed(AppRoutes.videoCall),
              )
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
