import 'package:dime/view/screen/doctor/info/widget/profeesional_qualifications_all_filed.dart';
import 'package:dime/view/screen/doctor/info/widget/registation_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/doctor/info/professional_qualifications_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';

class ProfessionalQualificationsScreen extends StatelessWidget {
  ProfessionalQualificationsScreen({super.key});

  final formKey = GlobalKey<FormState>();

  String type = Get.parameters["type"] ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Professional Qualifications".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<ProfessionalQualificationsController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  type == "back"
                      ? const SizedBox()
                      : const RegistrationStep(indexNumber: 2),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ProfessionalQualificationsAllFiled(),
                  CustomButton(
                    titleText: type == "back" ? "Save Changes".tr : "Next".tr,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (type == "back") {
                          Get.back();
                        } else {
                          Get.toNamed(AppRoutes.addedExperience);
                        }
                      }
                    },
                  ),
                  SizedBox(height: 30.h)
                ],
              ),
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
