import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/user/Booking/shhedule_reply_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../helpers/other_helper.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class ScheduleReply extends StatelessWidget {
  ScheduleReply({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Schedule a call".tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<ScheduleReplyController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: controller.subjectController,
                    hindText: 'Subject',
                    validator: OtherHelper.validator,
                    fillColor: AppColors.transparent,
                    fieldBorderColor: AppColors.black,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    controller: controller.descriptionController,
                    hindText: 'Description',
                    validator: OtherHelper.validator,
                    fillColor: AppColors.transparent,
                    fieldBorderColor: AppColors.black,
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 350.h,
                  ),
                  CustomButton(
                    titleText: "Pay".tr,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Get.toNamed(AppRoutes.paymentMethod);
                      }
                    },
                  )
                ],
              ),
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
