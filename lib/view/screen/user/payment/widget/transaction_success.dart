import 'package:dime/utils/app_colors.dart';
import 'package:dime/utils/app_icons.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:dime/view/common_widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/user/payment/payment_controller.dart';

class TransactionSuccess extends StatelessWidget {
  const TransactionSuccess({
    super.key,
    required this.amount,
    required this.cardNumber,
  });

  final num amount;
  final int cardNumber;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) => Container(
          width: Get.width,
          height: 600.h,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.backgroundPopup))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 20.h),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CustomImage(
                  imageSrc: AppIcons.right,
                  height: 64.sp,
                  width: 64.sp,
                ),
                CustomText(
                  text: "Transaction Successful".tr,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  top: 24.sp,
                  bottom: 4.h,
                ),
                CustomText(
                  text: "Your top up has been successful done".tr,
                  fontSize: 16.sp,
                  maxLines: 2,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  text: "Total Pay".tr,
                  fontSize: 16.sp,
                  top: 20.h,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteDarkActive,
                ),
                CustomText(
                  text: "\$$amount",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Total Top Up'.tr,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    top: 70.h,
                    bottom: 20.h,
                    left: 12.w,
                    color: AppColors.whiteDarkActive,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Row(
                    children: [
                      CustomImage(
                        imageSrc: AppIcons.wallet,
                        height: 36.sp,
                        width: 36.sp,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Standard Charted Card".tr,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: cardNumber.toString(),
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.whiteDarkActive,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                  titleText: 'Close'.tr,
                  onTap: () => controller.closePayment(),
                )
              ],
            ),
          )),
    );
  }
}
