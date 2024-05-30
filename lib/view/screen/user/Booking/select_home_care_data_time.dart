import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/Booking/home_care_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../helpers/other_helper.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/pop up/success_pop_up.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class SelectHomeCareDataTime extends StatelessWidget {
  const SelectHomeCareDataTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Book Appointment".tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<HomeCareController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Booking Date".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  bottom: 8.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFCFCFC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 18,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: controller.startController,
                                hindText: "End date".tr,
                                keyboardType: TextInputType.none,
                                fieldBorderColor: AppColors.transparent,
                                validator: OtherHelper.validator,
                                suffixIcon: const Icon(Icons.date_range),
                                textStyle: const TextStyle(height: 2.7),
                                onTap: () => OtherHelper.datePicker(
                                    controller.startController),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 36.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFCFCFC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 18,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: controller.endController,
                                hindText: "End date".tr,
                                keyboardType: TextInputType.none,
                                fieldBorderColor: AppColors.transparent,
                                validator: OtherHelper.validator,
                                suffixIcon: const Icon(Icons.date_range),
                                textStyle: TextStyle(height: 2.7),
                                onTap: () => OtherHelper.datePicker(
                                    controller.endController),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomText(
                  text: "Select Hour".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  bottom: 8.h,
                  top: 20.sp,
                ),
                SizedBox(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 60.h),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.selectHourOption.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => controller.selectTime(index),
                        child: Container(
                          margin: EdgeInsets.all(8.sp),
                          decoration: BoxDecoration(
                              color: controller.selectedTime ==
                                      controller.selectHourOption[index]
                                  ? AppColors.black
                                  : AppColors.blueLight,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: CustomText(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                color: controller.selectedTime ==
                                        controller.selectHourOption[index]
                                    ? AppColors.white
                                    : AppColors.blueNormal,
                                text: controller.selectHourOption[index]
                                    .toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  titleText: "Book Appointment".tr,
                  onTap: () => PopUp.successPopUp(
                      title: "Booking Successfully".tr,
                      onTap: () => Get.toNamed(AppRoutes.myBooking),
                      message:
                          "Your appointment with Dr. David Patel is confirmed for ${controller.startController.text} - ${controller.endController.text}, at ${controller.selectedTime}"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
