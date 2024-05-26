import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/button/custom_button.dart';
import '../../../../common_widgets/text/custom_text.dart';

class CancelPopup {
  static popUp() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: EdgeInsets.all(12.sp),
          title: CustomText(
            text: "You sure want to cancel appointment".tr,
            maxLines: 2,
            fontWeight: FontWeight.w600,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  titleText: "No".tr,
                  borderWidth: 1.5,
                  borderColor: AppColors.blueLightActive,
                  buttonColor: AppColors.transparent,
                  titleColor: AppColors.blueNormal,
                  onTap: () => Get.back(),
                )),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                    child: CustomButton(
                  titleText: "Yes".tr,
                  onTap: () => Get.offAllNamed(AppRoutes.doctorHome),
                ))
              ],
            ),
          ],
        );
      },
    );
  }
}
