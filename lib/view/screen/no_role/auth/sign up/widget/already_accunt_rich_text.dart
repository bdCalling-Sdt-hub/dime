import 'package:dime/core/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/app_colors.dart';

class AlreadyAccountRichText extends StatelessWidget {
  AlreadyAccountRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account".tr,
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.blueDarkHover,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: "Sign in".tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(AppRoutes.signIn);
                    },
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.secondPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }
}
