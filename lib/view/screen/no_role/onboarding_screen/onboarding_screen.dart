import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../../../utils/app_icons.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/image/custom_image.dart';
import '../../../common_widgets/text/custom_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(
              height: 250.h,
            ),
            CustomText(
              text: "Lets you in",
              fontSize: 48.sp,
              top: 57.h,
              bottom: 57.h,
            ),
            CustomButton(
              titleText: "Sign in with password".tr,
              onTap: () => Get.toNamed(AppRoutes.signIn),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              titleText: "Sign up".tr,
              onTap: () => Get.toNamed(AppRoutes.signUp),
            ),
          ],
        ),
      ),
    );
  }
}
