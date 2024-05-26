import 'package:dime/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../core/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/button/custom_button.dart';
import '../../../../common_widgets/text/custom_text.dart';
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(
              height: 105.h,
            ),
            CustomTextField(
              prefixIcon: const Icon(Icons.mail),
              labelText: "Email".tr,
              validator: OtherHelper.validator,
            ),
            SizedBox(
              height: 20.h,
            ),
            IntlPhoneField(
              // controller: controller.numberController,
              // validator: (value) {
              //   if (value!.number.isEmpty) {
              //     return "Invalid Mobile Number".tr;
              //   }
              // },
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
            SizedBox(
              height: 70.h,
            ),
            CustomButton(
              titleText: "Continue".tr,
              onTap: () => Get.toNamed(AppRoutes.verifyEmail),
            ),
          ],
        ),
      ),
    );
  }
}
