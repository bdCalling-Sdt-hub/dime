import 'package:dime/models/appointment_upcoming_model.dart';
import 'package:dime/view/common_widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/consultant/patients_info/doctor_home_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/appointment_request_item.dart';
import 'widget/patients_list_item.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        DoctorHomeController.instance.getUpcomingAppointmentRepo();
        DoctorHomeController.instance.getAppointmentRequestRepo();
      },
    );
    super.initState();
  }

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
                CustomText(
                  text: "Appointment List".tr,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  maxLines: 1,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.patientsList),
                    child: CustomText(
                      text: "See all".tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      bottom: 12.h,
                      color: AppColors.secondPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 400.h,
                  child: controller.upcomingList.isEmpty
                      ? const NoData()
                      : GridView.builder(
                          itemCount: controller.upcomingList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 12.sp,
                                  crossAxisSpacing: 12.sp,
                                  mainAxisExtent: 200.h),
                          itemBuilder: (context, index) {
                            Appointment item = controller.upcomingList[index];
                            return GestureDetector(
                              onTap: () => Get.toNamed(
                                  AppRoutes.patientsDetails,
                                  parameters: {"appointmentId": item.id}),
                              child: PatientsListItem(
                                  image: item.user.image,
                                  name: item.user.fullName,
                                  dateTime: item.appointmentTime),
                            );
                          },
                        ),
                ),
                CustomText(
                  text: "Appointment Request".tr,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  maxLines: 1,
                  top: 26.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.appointmentList),
                    child: CustomText(
                      text: "See all".tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      top: 16.h,
                      bottom: 12.h,
                      color: AppColors.secondPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  child: controller.pendingList.isEmpty
                      ? const NoData()
                      : ListView.builder(
                          itemCount: controller.pendingList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Appointment item = controller.pendingList[index];

                            return GestureDetector(
                              onTap: () => Get.toNamed(
                                  AppRoutes.patientsDetails,
                                  parameters: {"appointmentId": item.id}),
                              child: AppointmentRequestItem(
                                dateTime: item.appointmentTime,
                                text: "Appointment with ${item.user.fullName}",
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
