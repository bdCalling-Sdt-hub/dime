import 'package:dime/controllers/user/Booking/my_booking_controller.dart';
import 'package:dime/core/app_routes.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:dime/utils/app_colors.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/user/payment/payment_controller.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Payment".tr,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
      body: GetBuilder<PaymentController>(
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            children: [
              CustomTextField(
                controller: controller.nameController,
                labelText: 'Account holder Name'.tr,
                validator: OtherHelper.validator,
                fillColor: AppColors.transparent,
                fieldBorderColor: AppColors.black,
                fieldBorderRadius: 4.r,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                controller: controller.nameController,
                labelText: 'Transaction ID'.tr,
                validator: OtherHelper.validator,
                fillColor: AppColors.transparent,
                fieldBorderColor: AppColors.black,
                fieldBorderRadius: 4.r,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                controller: controller.accountNumberController,
                labelText: 'Account Number'.tr,
                validator: OtherHelper.validator,
                fillColor: AppColors.transparent,
                keyboardType: TextInputType.number,
                fieldBorderColor: AppColors.black,
                fieldBorderRadius: 4.r,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                controller: controller.accountNumberController,
                labelText: 'Amount'.tr,
                validator: OtherHelper.validator,
                fillColor: AppColors.transparent,
                keyboardType: TextInputType.number,
                fieldBorderColor: AppColors.black,
                fieldBorderRadius: 4.r,
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomButton(
                titleText: 'Payment',
                onTap: () {
                  Get.toNamed(AppRoutes.myBooking, parameters: {"index": "2"});
                },
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
