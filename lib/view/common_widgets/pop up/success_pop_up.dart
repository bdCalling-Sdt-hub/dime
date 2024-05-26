import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../../utils/app_colors.dart';
import '../../../helpers/prefs_helper.dart';
import '../../../utils/app_images.dart';
import '../button/custom_button.dart';
import '../image/custom_image.dart';
import '../text/custom_text.dart';

class PopUp {
  static successPopUp(
      {required title,
      String? message,
      VoidCallback? onTap,
      bool isLoading = false}) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: EdgeInsets.all(12.sp),
          content: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(
                  imageSrc: AppImages.bookingSuccessfully,
                  imageType: ImageType.png,
                  height: 130.sp,
                  width: 130.sp,
                ),
                CustomText(
                  text: title,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.greyDarker,
                  maxLines: 1,
                  top: 32.h,
                  bottom: 8.h,
                ),
                message != null
                    ? CustomText(
                        text: message,
                        maxLines: 3,
                        color: AppColors.base,
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 24.h,
                ),
                CustomButton(
                  titleText: "done".tr,
                  onTap: onTap,
                  isLoading: isLoading,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: CustomText(
                    text: "Edit your appointment".tr,
                    top: 16.h,
                    color: AppColors.secondPrimary,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static logOutPopUp() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: EdgeInsets.all(12.sp),
          title: CustomText(
            text: "You sure want to logout".tr,
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
                  onTap: () => PrefsHelper.removeAllPrefData(),
                ))
              ],
            ),
          ],
        );
      },
    );
  }
}
