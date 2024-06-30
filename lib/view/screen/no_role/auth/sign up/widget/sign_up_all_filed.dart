import 'package:dime/helpers/other_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../controllers/auth/sign_up_controller.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../common_widgets/text_field/custom_number_text_filed.dart';
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
            CustomNumberTextFiled(
              controller: controller.numberController,
              countryChange: controller.onCountryChange,
            ),
            // controller.selectRole == 'User'
            //     ? Column(
            //         children: [
            //           Container(
            //               height: 140.h,
            //               width: double.infinity,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(8.r),
            //                   border: Border.all(color: AppColors.greyLight)),
            //               child: controller.image != null
            //                   ? Image.file(File(controller.image!))
            //                   : GestureDetector(
            //                       onTap: controller.openGallery,
            //                       child: Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Icon(
            //                             Icons.add,
            //                             size: 40.sp,
            //                           ),
            //                           CustomText(
            //                             text: "Upload".tr,
            //                             fontSize: 24.sp,
            //                             fontWeight: FontWeight.w700,
            //                           )
            //                         ],
            //                       ),
            //                     )),
            //         ],
            //       )
            //     : const SizedBox(),
          ],
        );
      },
    );
  }
}
