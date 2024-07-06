import 'package:dime/controllers/consultant/transaction/transaction_controller.dart';
import 'package:dime/controllers/consultant/transaction/withdraw_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helpers/other_helper.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Withdraw".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<WithdrawController>(
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Form(
            key: formKey,
            child: Column(
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
                  controller: controller.accountNumberController,
                  labelText: 'Account Number'.tr,
                  validator: OtherHelper.validator,
                  fillColor: AppColors.transparent,
                  keyboardType: TextInputType.number,
                  fieldBorderColor: AppColors.black,
                  fieldBorderRadius: 4.r,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.cedulaNumberController,
                  labelText: 'cedula Number'.tr,
                  validator: OtherHelper.validator,
                  fillColor: AppColors.transparent,
                  fieldBorderColor: AppColors.black,
                  fieldBorderRadius: 4.r,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.bankNameController,
                  labelText: 'Bank Name'.tr,
                  validator: OtherHelper.validator,
                  fillColor: AppColors.transparent,
                  keyboardType: TextInputType.number,
                  fieldBorderColor: AppColors.black,
                  fieldBorderRadius: 4.r,
                ),

                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.accountTypeController,
                  labelText: 'account Type'.tr,
                  validator: OtherHelper.validator,
                  fillColor: AppColors.transparent,
                  keyboardType: TextInputType.number,
                  fieldBorderColor: AppColors.black,
                  fieldBorderRadius: 4.r,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.amountController,
                  labelText: 'Amount'.tr,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This field is required".tr;
                    } else {

                      int amount = int.tryParse(TransactionController.instance.amount) ?? 0;
                      int withdrawAmount = int.tryParse(value) ?? 0;

                      if(amount> withdrawAmount) {
                        return null ;
                      } else {
                        return 'insufficient balance'.tr ;
                      }



                    }
                  },
                  fillColor: AppColors.transparent,
                  keyboardType: TextInputType.number,
                  fieldBorderColor: AppColors.black,
                  fieldBorderRadius: 4.r,
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                  titleText: 'Withdraw'.tr,
                  isLoading: controller.isLoading,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      controller.withdrawRequestsRepo();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
