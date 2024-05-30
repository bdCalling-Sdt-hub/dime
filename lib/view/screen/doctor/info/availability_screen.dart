import 'package:dime/helpers/other_helper.dart';
import 'package:dime/utils/app_colors.dart';
import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/doctor/info/availability_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/hour_item.dart';
import 'widget/registation_step.dart';
import 'widget/week_item.dart';

class AvailabilityScreen extends StatelessWidget {
  AvailabilityScreen({super.key});

  String type = Get.parameters["type"] ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Added Experience".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<AvailabilityController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                type == "back"
                    ? const SizedBox()
                    : const Center(child: RegistrationStep(indexNumber: 4)),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  text: "Please select the days".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  bottom: 18.h,
                ),
                SizedBox(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.week.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 50.h,
                        crossAxisSpacing: 18.sp,
                        mainAxisSpacing: 18.sp),
                    itemBuilder: (context, index) {
                      var item = controller.week[index];
                      return GestureDetector(
                        onTap: () => controller.selectWeek(index),
                        child: WeekItem(
                          title: item,
                          isSelected:
                              controller.selectedWeekList.contains(item),
                        ),
                      );
                    },
                  ),
                ),
                CustomText(
                  text: "Select Hour".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  bottom: 16.h,
                  top: 25.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                      controller: controller.startController,
                      fieldBorderColor: AppColors.secondPrimary,
                      fillColor: AppColors.transparent,
                      hindText: 'Start'.tr,
                      validator: OtherHelper.validator,
                      fieldBorderRadius: 6.r,
                      keyboardType: TextInputType.none,
                      suffixIcon: const Icon(Icons.access_time),
                          onTap: () =>
                              OtherHelper.openTimePicker(controller.startController),
                    )),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                        child: CustomTextField(
                      controller: controller.endController,
                      fieldBorderColor: AppColors.secondPrimary,
                      fillColor: AppColors.transparent,
                      keyboardType: TextInputType.none,
                      hindText: 'End'.tr,
                      onTap: () =>
                          OtherHelper.openTimePicker(controller.endController),
                      validator: OtherHelper.validator,
                      fieldBorderRadius: 6.r,
                      suffixIcon: const Icon(Icons.access_time),
                    )),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                  titleText: type == "back" ? "Save Changes".tr : "Next".tr,
                  onTap: () {
                    if (type == "back") {
                      Get.back();
                    } else {
                      Get.toNamed(AppRoutes.identificationScreen);
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: type == "back"
          ? const CustomDoctorBottomNavBar(currentIndex: 3)
          : const SizedBox(),
    );
  }
}
