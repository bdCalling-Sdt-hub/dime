import 'package:dime/controllers/user/payment/peigo_payment_controller.dart';
import 'package:dime/extension/my_extension.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:dime/view/common_widgets/text/custom_text.dart';
import 'package:dime/view/screen/user/payment/widgets/payment_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/button/custom_button.dart';

class PeigoInfoScreen extends StatefulWidget {
  PeigoInfoScreen({super.key});

  @override
  State<PeigoInfoScreen> createState() => _PeigoInfoScreenState();
}

class _PeigoInfoScreenState extends State<PeigoInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const CustomText(
            text: "Payment Info",
            fontSize: 24,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.w, color: AppColors.secondPrimary),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: "Payment Information".tr,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondPrimary,
                          bottom: 8.h,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Account user Name :".tr,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Naimul Hassan ",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              textAlign: TextAlign.start,
                              bottom: 12.h,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Phone Number:".tr,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "14461545232",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              textAlign: TextAlign.start,
                              bottom: 12.h,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "Amount:".tr,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: PeigoPaymentController
                                  .instance.amountController.text,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondPrimary,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                const CustomImage(
                  imageSrc: AppImages.qrCode,
                  imageType: ImageType.png,
                  height: 200,
                  width: 200,
                ),
                50.height,
                CustomButton(
                    titleText: "Confirm".tr,
                    buttonRadius: 20.r,
                    titleColor: AppColors.white,
                    buttonWidth: double.infinity,
                    titleSize: 20.sp,
                    onTap: () {
                      Get.toNamed(AppRoutes.peigo);
                    })
              ],
            ),
          ),
        ));
  }
}
