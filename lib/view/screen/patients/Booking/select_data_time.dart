import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/patients/Booking/Book_appointment_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/pop up/success_pop_up.dart';
import '../../../common_widgets/text/custom_text.dart';

class SelectDataTime extends StatelessWidget {
  const SelectDataTime({super.key});

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
      body: GetBuilder<BookAppointmentController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Select Date".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  bottom: 8.h,
                ),
                Container(
                  height: 300.h,
                  decoration: ShapeDecoration(
                    color: AppColors.blueLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0C000000),
                        blurRadius: 6,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 15,
                        offset: Offset(0, 10),
                        spreadRadius: -3,
                      )
                    ],
                  ),
                  child: CalendarDatePicker(
                      initialDate: controller.getInitialDate(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      onDateChanged: controller.selectData,
                      selectableDayPredicate: controller.disableDay
                  ),
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
                          "Your appointment with Dr. David Patel is confirmed for ${controller.selectedData}, at ${controller.selectedTime}"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
