import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/consultant/info/personal_information_controller.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/personal_info_all_filed.dart';
import 'widget/registation_step.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final String type = Get.parameters["type"] ?? "";

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
                    isLoading: controller.isLoading,
                    titleText:
                        type == "back" ? "Save Changes".tr : "Continue".tr,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.updateProfile(type);

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
