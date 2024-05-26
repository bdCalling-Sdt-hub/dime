import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/patients/health_rocords_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class HealthRecords extends StatelessWidget {
  const HealthRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Book Appointment".tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<HealthRecordController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text:
                        "Upload your previous prescription or medical test report"
                            .tr,
                    maxLines: 2,
                    fontSize: 18.sp,
                    top: 30.h,
                    bottom: 16.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.image != null
                        ? Image.file(
                            File(controller.image!),
                            height: 60.sp,
                            width: 60.sp,
                          )
                        : const SizedBox(),
                    GestureDetector(
                      onTap: controller.openImage,
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: AppColors.greyLight,
                          border: Border.all(
                              color: AppColors.transparent, width: 1),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.add_photo_alternate_outlined,
                              color: AppColors.primary,
                            ),
                            CustomText(text: "Upload Health Records".tr)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                CustomText(
                  text: "Added additional details(if you want)".tr,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  top: 20.sp,
                  bottom: 12.h,
                ),
                CustomTextField(
                  controller: controller.descriptionController,
                  fieldBorderRadius: 10.r,
                  fillColor: AppColors.blueLight,
                  maxLines: null,
                  hindText: "Write here".tr,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(child: CustomButton(titleText: "Save".tr, buttonWidth: Get.width* 0.5,))
              ],
            ),
          );
        },
      ),
    );
  }
}
