import 'dart:convert';

import 'package:dime/helpers/other_helper.dart';
import 'package:dime/utils/app_utils.dart';
import 'package:dime/view/common_widgets/pop%20up/custom_pop_up_menu_button.dart';
import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/Booking/book_appointment_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';

class SelectDataTime extends StatefulWidget {
  const SelectDataTime({super.key});

  @override
  State<SelectDataTime> createState() => _SelectDataTimeState();
}

class _SelectDataTimeState extends State<SelectDataTime> {
  final formKey = GlobalKey<FormState>();

  String id = Get.parameters["id"] ?? '';

  String amount = Get.parameters["amount"] ?? '';

  String availability = Get.parameters["availability"] ?? "";

  @override
  void initState() {
    BookAppointmentController.instance.id = id;
    BookAppointmentController.instance.amount = amount;
    BookAppointmentController.instance
        .setAvailability(jsonDecode(availability));
    super.initState();
  }

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
      body: GetBuilder<BookAppointmentController>(
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
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Call Duration".tr,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: CustomTextField(
                          controller: controller.callDurationController,
                          fillColor: AppColors.black,
                          hindText: 'Call Duration'.tr,
                          validator: OtherHelper.validator,
                          textStyle: const TextStyle(color: AppColors.white),
                          suffixIcon: PopUpMenu(
                              items: controller.callDurations,
                              iconColor: AppColors.white,
                              selectedItem: [
                                controller.callDurationController.text
                              ],
                              onTap: controller.selectCallDuration),
                        ),
                      )
                    ],
                  ),
                  CustomText(
                    text: "Select Date".tr,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    bottom: 8.h,
                  ),
                  Container(
                    height: 300.h,
                    decoration: ShapeDecoration(
                      color: AppColors.blueLightActive,
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
                      initialDate:
                          controller.getInitialDate(jsonDecode(availability)),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      onDateChanged: controller.selectData,
                      selectableDayPredicate: (day) =>
                          controller.disableDay(day, jsonDecode(availability)),
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
                                    : AppColors.blueLightActive,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Center(
                              child: CustomText(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: controller.selectedTime ==
                                          controller.selectHourOption[index]
                                      ? AppColors.white
                                      : AppColors.white,
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
                    isLoading: controller.isLoading,
                    titleText: "Appointment".tr,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (controller.selectedData != "") {
                          if (controller.selectedTime != '') {
                            controller.bookAppointment();
                          } else {
                            Utils.snackBarMessage(
                                'time', "please, select time");
                          }
                        } else {
                          Utils.snackBarMessage('date', "please, select date");
                        }
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
