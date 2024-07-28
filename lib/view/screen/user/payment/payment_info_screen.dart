import 'package:dime/view/common_widgets/text/custom_text.dart';
import 'package:dime/view/screen/user/payment/widgets/payment_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/button/custom_button.dart';

class PaymentMethodFinal extends StatefulWidget {
  PaymentMethodFinal({super.key});

  @override
  State<PaymentMethodFinal> createState() => _PaymentMethodFinalState();
}

class _PaymentMethodFinalState extends State<PaymentMethodFinal> {
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
                  child: PaymentInformation(),
                ),
                SizedBox(
                  height: 120.h,
                ),
                CustomButton(
                    titleText: "Confirm".tr,
                    buttonRadius: 20.r,
                    titleColor: AppColors.white,
                    buttonWidth: double.infinity,
                    titleSize: 20.sp,
                    onTap: () {
                      Get.toNamed(AppRoutes.payment);
                    })
              ],
            ),
          ),
        ));
  }
}
