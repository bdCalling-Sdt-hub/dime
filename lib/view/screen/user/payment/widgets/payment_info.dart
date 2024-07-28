import 'package:dime/controllers/user/payment/payment_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';

class PaymentInformation extends StatelessWidget {
  PaymentInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: "Payment Information".tr,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.secondPrimary,
            bottom: 8.h,
          ),
          Row(
            children: [
              CustomText(
                text: "Bank :".tr,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "Bank Asia ",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                textAlign: TextAlign.start,
                bottom: 12.h,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "Account Type :".tr,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "Saving",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                textAlign: TextAlign.start,
                bottom: 12.h,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "Account Number :".tr,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "021213245356 ",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                textAlign: TextAlign.start,
                bottom: 12.h,
              ),
              IconButton(
                  onPressed: () {
                    final value = ClipboardData(text: " ");
                    Clipboard.setData(value);
                    Get.snackbar("Copy", "Copied to clipboard");
                  },
                  icon: const Icon(Icons.copy))
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "Account holder Name :".tr,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Naimul Hassan ",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                textAlign: TextAlign.start,
                bottom: 12.h,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "Cedula Number :".tr,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: " 364165446",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                textAlign: TextAlign.start,
                bottom: 12.h,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "Amount:".tr,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: PaymentController.instance.amountController.text,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.secondPrimary,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
