import 'package:dime/helpers/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/auth/sign_up_controller.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/button/custom_button.dart';
import '../../../../common_widgets/text/custom_text.dart';
import 'widget/already_accunt_rich_text.dart';
import 'widget/sign_up_all_filed.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<SignUpController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: formKey,
                child: Column(children: [
                  CustomText(
                    text: "Create Your Account".tr,
                    fontSize: 32.sp,
                    bottom: 20.h,
                  ),
                  const SignUpAllField(),
                  Row(
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
                            color: controller.selectRole ==
                                    controller.selectedOption[0]
                                ? AppColors.secondPrimary
                                : AppColors.black,
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
                            color: controller.selectRole ==
                                    controller.selectedOption[1]
                                ? AppColors.secondPrimary
                                : AppColors.black,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton(
                    titleText: "Sign up".tr,
                    isLoading: controller.isLoading,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.signUpUser();
                        PrefsHelper.myRole = controller.selectRole;
                      }
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const AlreadyAccountRichText()
                ]),
              ),
            );
          },
        ));
  }
}
