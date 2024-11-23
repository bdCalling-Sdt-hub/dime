import 'package:dime/extension/my_extension.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:dime/utils/app_colors.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/payment/peigo_payment_controller.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';

class PeigoPaymentScreen extends StatelessWidget {
  PeigoPaymentScreen({super.key});

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
      body: GetBuilder<PeigoPaymentController>(
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: controller.nameController,
                  labelText: 'Pei-gp user Name'.tr,
                  validator: OtherHelper.validator,
                  fillColor: AppColors.transparent,
                  fieldBorderColor: AppColors.black,
                  fieldBorderRadius: 4.r,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.numberController,
                  labelText: 'Pei-gp Phone Number'.tr,
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
                  controller: controller.emailController,
                  labelText: 'Pei-gp E-mail'.tr,
                  validator: OtherHelper.validator,
                  fillColor: AppColors.transparent,
                  fieldBorderColor: AppColors.black,
                  fieldBorderRadius: 4.r,
                ),
                16.height,
                CustomTextField(
                  controller: controller.amountController,
                  labelText: 'Amount'.tr,
                  validator: OtherHelper.validator,
                  fillColor: AppColors.transparent,
                  fieldBorderColor: AppColors.black,
                  fieldBorderRadius: 4.r,
                ),
                SizedBox(
                  height: 80.h,
                ),
                CustomButton(
                  titleText: 'Submit'.tr,
                  isLoading: controller.isLoading,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      controller.paymentRequestsRepo();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 9,
      ),
    );
  }
}
