
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/consultant/info/Personal_information_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/personal_Info_all_Filed.dart';
import 'widget/registation_step.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  String type = Get.parameters["type"] ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Personal Information".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<PersonalInformationController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  type == "back"
                      ? const SizedBox()
                      : const RegistrationStep(indexNumber: 1),
                  const PersonalInfoAllFiled(),
                  CustomButton(
                    titleText:
                        type == "back" ? "Save Changes".tr : "Continue".tr,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (type == "back") {
                          Get.back();
                        } else {
                          Get.toNamed(AppRoutes.availability);
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
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
