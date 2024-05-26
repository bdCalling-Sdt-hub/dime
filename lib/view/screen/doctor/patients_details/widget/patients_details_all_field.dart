import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/doctor/patients_details/patients_details_controller.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';


class PatientsDetailsAllFiled extends StatelessWidget {
  const PatientsDetailsAllFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientsDetailsController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Booking Date".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      isEnabled: false,
                      vertical: 8.h,
                      controller: controller.bookingDateController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderRadius: 10.r,
                      hindText: "Booking Date".tr,
                    ),
                  ],
                )),
                SizedBox(
                  width: 20.sp,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Booking Time".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      isEnabled: false,
                      vertical: 8.h,
                      controller: controller.bookingTimeController,
                      fieldBorderRadius: 10.r,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.datetime,
                      hindText: "Booking Time".tr,
                    ),
                  ],
                )),
              ],
            ),
            CustomText(
              text: "Patients Name".tr,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              top: 12.h,
              bottom: 12.h,
            ),
            CustomTextField(
              isEnabled: false,
              vertical: 8.h,
              controller: controller.nameController,
              validator: OtherHelper.validator,
              prefixIcon: const Icon(Icons.person),
              keyboardType: TextInputType.name,
              fieldBorderRadius: 10.r,
              hindText: "Enter Name".tr,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Date of birth".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      isEnabled: false,
                      vertical: 8.h,
                      controller: controller.dateOfBirthController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderRadius: 10.r,
                      onTap: () => OtherHelper.datePicker(
                          controller.dateOfBirthController),
                      hindText: "Date of birth".tr,
                    ),
                  ],
                )),
                SizedBox(
                  width: 20.sp,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Age".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      isEnabled: false,
                      vertical: 8.h,
                      controller: controller.nameController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.number,
                      fieldBorderRadius: 10.r,
                      hindText: "Age".tr,
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Gender".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      isEnabled: false,
                      vertical: 8.h,
                      controller: controller.genderController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderRadius: 10.r,
                      hindText: "Gender".tr,
                    ),
                  ],
                )),
                SizedBox(
                  width: 20.sp,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Blood Group".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      isEnabled: false,
                      vertical: 8.h,
                      controller: controller.bloodGroupController,
                      fieldBorderRadius: 10.r,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.datetime,
                      hindText: "Blood Group".tr,
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Height(Feet)".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      isEnabled: false,
                      vertical: 8.h,
                      controller: controller.heightController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.number,
                      fieldBorderRadius: 10.r,
                      hindText: "Height(Feet)".tr,
                    ),
                  ],
                )),
                SizedBox(
                  width: 20.sp,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Weight(kg)".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      isEnabled: false,
                      vertical: 8.h,
                      controller: controller.weightController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.number,
                      fieldBorderRadius: 10.r,
                      hindText: "Weight(kg)".tr,
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.additionalDetails),
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.insert_chart_outlined_rounded,
                          color: AppColors.blueNormal,
                        ),
                        CustomText(
                          text: "Health Records".tr,
                          color: AppColors.blueNormal,
                          left: 8.w,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
