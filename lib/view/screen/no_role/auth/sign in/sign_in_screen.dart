import 'package:dime/controllers/auth/signIn_controller.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../helpers/prefs_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../common_widgets/button/custom_button.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/do_not_account.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<SignInController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomText(
                      text: "Login to Your Account".tr,
                      fontSize: 32.sp,
                      bottom: 20.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: controller.emailController,
                      prefixIcon: const Icon(Icons.mail),
                      labelText: "Email".tr,
                      validator: OtherHelper.emailValidator,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextField(
                      controller: controller.passwordController,
                      prefixIcon: const Icon(Icons.lock),
                      isPassword: true,
                      labelText: "Password".tr,
                      validator: OtherHelper.passwordValidator,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                        child: CustomText(
                          text: "Forgot the password".tr,
                          top: 10.h,
                          bottom: 30.h,
                          color: AppColors.secondPrimary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CustomButton(
                      titleText: "Sign in".tr,
                      isLoading: controller.isLoading,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.signInUser();
                        }
                      },
                    ),

                    SizedBox(
                      height: 30.h,
                    ),
                    CustomButton(
                      titleText: "Sign in consultant".tr,
                      isLoading: controller.isLoading,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.signInUser();
                        }
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const DoNotHaveAccont()
                  ],
                ),
              ),
            );
          },
        ));
  }
}
