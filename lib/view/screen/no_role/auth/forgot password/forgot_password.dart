import 'package:dime/controllers/auth/forget_password_controller.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes.dart';
import '../../../../common_widgets/button/custom_button.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_number_text_filed.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Forgot Password".tr,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        body: SingleChildScrollView(
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
                height: 100.h,
              ),
              // CustomNumberTextFiled(
              //   controller: controller.numberController,
              //   countryChange: (value) => print(value),
              // ),
              // SizedBox(
              //   height: 70.h,
              // ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: CustomButton(
            titleText: "Continue".tr,
            isLoading: controller.isLoadingEmail,
            onTap: () => controller.forgotPasswordRepo(),
          ),
        ),
      ),
    );
  }
}
