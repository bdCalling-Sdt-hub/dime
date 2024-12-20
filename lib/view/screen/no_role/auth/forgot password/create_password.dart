import 'package:dime/controllers/auth/forget_password_controller.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_images.dart';
import '../../../../common_widgets/button/custom_button.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';

class CreatePassword extends StatelessWidget {
  CreatePassword({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Create New Password".tr,
          fontWeight: FontWeight.w700,
          fontSize: 24.sp,
        ),
      ),
      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 64.h,
                  ),
                  CustomImage(
                    imageSrc: AppImages.createPasswordImage,
                    imageType: ImageType.png,
                    height: 297.h,
                  ),
                  CustomText(
                    text: "Create Your New Password".tr,
                    fontSize: 18.sp,
                    textAlign: TextAlign.start,
                    top: 64.h,
                    bottom: 24.h,
                  ),
                  CustomTextField(
                    controller: controller.passwordController,
                    prefixIcon: const Icon(Icons.lock),
                    labelText: "Password".tr,
                    isPassword: true,
                    validator: OtherHelper.passwordValidator,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    controller: controller.confirmPasswordController,
                    prefixIcon: const Icon(Icons.lock),
                    labelText: "Confirm Password".tr,
                    validator: (value) => OtherHelper.confirmPasswordValidator(
                        value, controller.passwordController),
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 64.h,
                  ),
                  CustomButton(
                    titleText: "Continue".tr,
                    isLoading: controller.isLoadingReset,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                       controller.resetPasswordRepo();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
