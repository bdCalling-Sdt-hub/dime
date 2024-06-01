import 'package:dime/controllers/auth/forget_password_controller.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../core/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/button/custom_button.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_number_text_filed.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Forgot Password".tr,
          fontWeight: FontWeight.w700,
          fontSize: 24.sp,
        ),
      ),
      body: GetBuilder<ForgetPasswordController>(
          builder: (controller) => SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 105.h,
                    ),
                    CustomTextField(
                      controller: controller.emailController,
                      prefixIcon: const Icon(Icons.mail),
                      labelText: "Email".tr,
                      validator: OtherHelper.emailValidator,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomNumberTextFiled(
                      controller: controller.numberController,
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    CustomButton(
                      titleText: "Continue".tr,
                      onTap: () => Get.toNamed(AppRoutes.verifyEmail),
                    ),
                  ],
                ),
              )),
    );
  }
}
