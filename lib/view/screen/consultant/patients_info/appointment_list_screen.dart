import 'package:dime/view/common_widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/consultant/patients_info/appointment_list_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../models/appointment_upcoming_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/appointment_request_item.dart';

class AppointmentListScreen extends StatefulWidget {
  const AppointmentListScreen({super.key});

  @override
  State<AppointmentListScreen> createState() => _AppointmentListScreenState();
}

class _AppointmentListScreenState extends State<AppointmentListScreen> {
  @override
  void initState() {
    AppointmentListController.instance.getAppointmentRequestRepo();
    AppointmentListController.instance.scrollController.addListener(
      () => AppointmentListController.instance.scrollControllerCall(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AppointmentListController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              children: [
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
                        controller: controller.dateController,
                        onTap: controller.openDatePicker,
                        fillColor: AppColors.greyLight,
                        horizontal: 6.w,
                        vertical: 2.h,
                        keyboardType: TextInputType.none,
                        fieldBorderRadius: 5.r,
                        hindText: "Select Date".tr,
                        textStyle:
                            const TextStyle(color: AppColors.secondPrimary),
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
                SizedBox(
                  child: controller.requests.isEmpty
                      ? const SizedBox(height: 400, child: NoData())
                      : ListView.builder(
                          itemCount: controller.requests.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Appointment item = controller.requests[index];
                            return GestureDetector(
                              onTap: () =>
                                  Get.toNamed(AppRoutes.patientsDetails),
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
