import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/doctor/patients_info/patients_list_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/patients_list_item.dart';

class PatientsListScreen extends StatelessWidget {
  const PatientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<PatientsListController>(
        builder: (controller) {
          return Padding(
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
                        controller: controller.dateController,
                        onTap: controller.openDatePicker,
                        fillColor: AppColors.blueLight,
                        horizontal: 6.w,
                        vertical: 2.h,
                        keyboardType: TextInputType.none,
                        fieldBorderRadius: 5.r,
                        hindText: "Select Date".tr,
                        suffixIcon: GestureDetector(
                            onTap: controller.openDatePicker,
                            child: Icon(
                              Icons.date_range,
                              color: AppColors.blueNormal,
                              size: 24.sp,
                            )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: 16,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12.sp,
                        crossAxisSpacing: 12.sp,
                        mainAxisExtent: 200.h),
                    itemBuilder: (context, index) {
                      return const PatientsListItem(
                          image: AppImages.annette,
                          name: "Annette Black",
                          time: "Fri, 12:00 PM");
                    },
                  ),
                ),
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
