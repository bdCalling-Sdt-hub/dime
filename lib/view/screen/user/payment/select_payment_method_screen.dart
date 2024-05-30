import 'package:dime/core/app_routes.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/user/payment/select_payment_method_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/transaction_success.dart';

class SelectPaymentMethodScreen extends StatelessWidget {
  const SelectPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Payment".tr,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
      body: GetBuilder<SelectPaymentMethodController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child:  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              Radio(
                                  value: controller.selectedOption[0],
                                  groupValue: controller.selectRole,
                                  activeColor: AppColors.secondPrimary,
                                  onChanged: controller.setSelectedRole),
                              CustomText(
                                text: controller.selectedOption[0],
                                fontSize: 18.sp,
                                color: AppColors.black,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: controller.selectedOption[1],
                                  groupValue: controller.selectRole,
                                  activeColor: AppColors.secondPrimary,
                                  onChanged: controller.setSelectedRole),
                              CustomText(
                                text: controller.selectedOption[1],
                                fontSize: 18.sp,
                                color: AppColors.black,
                              )
                            ],
                          ),
                          CustomButton(
                            titleText: 'Continue'.tr,
                            onTap: () => Get.toNamed(AppRoutes.payment),
                          )
                        ],
                      ),
                    ],
                  ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 9,
      ),
    );
  }
}
