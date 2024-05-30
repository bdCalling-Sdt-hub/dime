import 'dart:io';

import 'package:dime/helpers/other_helper.dart';
import 'package:dime/utils/app_icons.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../../controllers/auth/sign_up_controller.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../common_widgets/text/custom_text.dart';
import '../../../../../common_widgets/text_field/custom_text_field.dart';

class SignUpAllField extends StatefulWidget {
  const SignUpAllField({super.key});

  @override
  State<SignUpAllField> createState() => _SignUpAllFieldState();
}

class _SignUpAllFieldState extends State<SignUpAllField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return Column(
          children: [
            CustomTextField(
              prefixIcon: const Icon(
                Icons.group,
                color: AppColors.whiteDarkHover,
              ),
              labelText: "Full Name".tr,
              controller: controller.nameController,
              validator: OtherHelper.validator,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              controller: controller.emailController,
              prefixIcon:
                  const Icon(Icons.mail, color: AppColors.greyLightActive),
              labelText: "Email".tr,
              validator: OtherHelper.emailValidator,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              controller: controller.passwordController,
              prefixIcon:
                  const Icon(Icons.lock, color: AppColors.greyLightActive),
              isPassword: true,
              labelText: "Password".tr,
              validator: OtherHelper.passwordValidator,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              controller: controller.confirmPasswordController,
              prefixIcon:
                  const Icon(Icons.lock, color: AppColors.greyLightActive),
              isPassword: true,
              labelText: "Confirm Password".tr,
              validator: (value) => OtherHelper.confirmPasswordValidator(
                  value, controller.passwordController),
            ),
            SizedBox(
              height: 30.h,
            ),
            IntlPhoneField(
              controller: controller.numberController,
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                hintText: "Phone Number".tr,
                fillColor: AppColors.blueLight,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.w, vertical: 14.h),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              initialCountryCode: "BD",
              disableLengthCheck: false,
            ),
            controller.selectRole == 'User'
                ? Column(
                    children: [
                      CustomTextField(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: const CustomImage(
                            imageSrc: AppIcons.clarify,
                            imageColor: AppColors.greyLightActive,
                          ),
                        ),
                        controller: controller.governmentIdController,
                        labelText: "Input your government ID details".tr,
                        validator: OtherHelper.validator,
                        keyboardType: TextInputType.number,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: "Upload your Passport documents".tr,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          top: 20.h,
                          bottom: 16.h,
                        ),
                      ),
                      Container(
                          height: 140.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: AppColors.greyLight)),
                          child: controller.image != null
                              ? Image.file(File(controller.image!))
                              : GestureDetector(
                                  onTap: controller.openGallery,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 40.sp,
                                      ),
                                      CustomText(
                                        text: "Upload".tr,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700,
                                      )
                                    ],
                                  ),
                                )),
                    ],
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
