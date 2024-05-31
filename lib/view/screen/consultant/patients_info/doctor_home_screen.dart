import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/consultant/patients_info/doctor_home_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/appointment_request_item.dart';
import 'widget/patients_list_item.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<DoctorHomeController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Patients List".tr,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    SizedBox(
                      width: 170.w,
                      child: CustomTextField(
                        controller: controller.listDateController,
                        onTap: controller.openListDatePicker,
                        fillColor: AppColors.blueLight,
                        fieldBorderColor: AppColors.black,

                        horizontal: 6.w,
                        vertical: 2.h,
                        keyboardType: TextInputType.none,
                        fieldBorderRadius: 5.r,
                        hindText: "Select Date".tr,
                        textStyle:
                            const TextStyle(color: AppColors.secondPrimary),
                        suffixIcon: GestureDetector(
                            onTap: controller.openListDatePicker,
                            child: Icon(
                              Icons.date_range,
                              color: AppColors.secondPrimary,
                              size: 24.sp,
                            )),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.patientsList),
                    child: CustomText(
                      text: "See all".tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      top: 26.h,
                      bottom: 12.h,
                      color: AppColors.secondPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 400.h,
                  child: GridView.builder(
                    itemCount: 6,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12.sp,
                        crossAxisSpacing: 12.sp,
                        mainAxisExtent: 200.h),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.patientsDetails),
                        child: const PatientsListItem(
                            image: AppImages.annette,
                            name: "Annette Black",
                            time: "Fri, 12:00 PM"),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CustomText(
                        text: "Appointment Request".tr,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      width: 170.w,
                      child: CustomTextField(
                        controller: controller.requestDateController,
                        onTap: controller.openRequestDatePicker,
                        fillColor: AppColors.greyLight,
                        horizontal: 6.w,
                        vertical: 2.h,
                        textStyle:
                            const TextStyle(color: AppColors.secondPrimary),
                        keyboardType: TextInputType.none,
                        fieldBorderRadius: 5.r,
                        hindText: "Select Date".tr,
                        fieldBorderColor: AppColors.black,
                        suffixIcon: GestureDetector(
                            onTap: controller.openRequestDatePicker,
                            child: Icon(
                              Icons.date_range,
                              color: AppColors.secondPrimary,
                              size: 24.sp,
                            )),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.appointmentList),
                    child: CustomText(
                      text: "See all".tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      top: 26.h,
                      bottom: 12.h,
                      color: AppColors.secondPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  child: ListView.builder(
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.patientsDetails),
                        child: const AppointmentRequestItem(
                          time: "Today, 11:30 AM",
                          text: "Appointment with Mr. Black",
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomDoctorBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
