import 'package:dime/controllers/patients/payment/payment_controller.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:dime/utils/app_colors.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/text/custom_text.dart';
import 'widget/transaction_success.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
        body: GetBuilder<PaymentController>(
          builder: (controller) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: controller.paymentSuccess
                ? const TransactionSuccess(
                    amount: 200.00,
                    cardNumber: 1213456789369852,
                  )
                : Column(
                    children: [
                      CustomTextField(
                        controller: controller.nameController,
                        labelText: 'Account holder Name'.tr,
                        validator: OtherHelper.validator,
                        fillColor: AppColors.transparent,
                        fieldBorderColor: AppColors.black,
                        fieldBorderRadius: 4.r,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        controller: controller.cardNumberController,
                        labelText: 'Card Number'.tr,
                        validator: OtherHelper.validator,
                        fillColor: AppColors.transparent,
                        keyboardType: TextInputType.number,
                        fieldBorderColor: AppColors.black,
                        fieldBorderRadius: 4.r,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: controller.expDateController,
                              labelText: 'Exp Date',
                              validator: OtherHelper.validator,
                              fillColor: AppColors.transparent,
                              fieldBorderColor: AppColors.black,
                              fieldBorderRadius: 4.r,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: 16.h,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: controller.cvvNumberController,
                              labelText: 'CVV Number',
                              validator: OtherHelper.validator,
                              fillColor: AppColors.transparent,
                              fieldBorderColor: AppColors.black,
                              keyboardType: TextInputType.number,
                              fieldBorderRadius: 4.r,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 400.h,
                      ),
                      CustomButton(
                        titleText: 'Payment',
                        onTap: () => controller.setPayment(true),
                      )
                    ],
                  ),
          ),
        ));
  }
}
