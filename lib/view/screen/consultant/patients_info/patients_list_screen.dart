import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/consultant/patients_info/patients_list_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../models/appointment_upcoming_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/patients_list_item.dart';

class PatientsListScreen extends StatefulWidget {
  const PatientsListScreen({super.key});

  @override
  State<PatientsListScreen> createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  @override
  void initState() {
    PatientsListController.instance.getAppointmentsRepo();
    PatientsListController.instance.scrollController.addListener(
      () => PatientsListController.instance.scrollControllerCall(),
    );
    super.initState();
  }

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
                      text: "Appointment List".tr,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    SizedBox(
                      width: 170.w,
                      child: CustomTextField(
                        controller: controller.dateController,
                        onTap: controller.openDatePicker,
                        fillColor: AppColors.greyLight,
                        horizontal: 6.w,
                        vertical: 2.h,
                        keyboardType: TextInputType.none,
                        fieldBorderColor: AppColors.black,
                        textStyle:
                            const TextStyle(color: AppColors.secondPrimary),
                        fieldBorderRadius: 5.r,
                        hindText: "Select Date".tr,
                        suffixIcon: GestureDetector(
                            onTap: controller.openDatePicker,
                            child: Icon(
                              Icons.date_range,
                              color: AppColors.secondPrimary,
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
                    itemCount: controller.appointments.length,
                    controller: controller.scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12.sp,
                        crossAxisSpacing: 12.sp,
                        mainAxisExtent: 200.h),
                    itemBuilder: (context, index) {
                      Appointment item = controller.appointments[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.patientsDetails),
                        child: PatientsListItem(
                            image: item.user.image,
                            name: item.user.fullName,
                            dateTime: item.appointmentTime),
                      );
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
