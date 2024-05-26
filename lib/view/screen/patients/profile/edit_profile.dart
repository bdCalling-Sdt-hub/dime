import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/patients/profile_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/edit_profile_all_filed.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
              text: "Book Appointment".tr,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const EditProfileAllFiled(),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                      titleText: "Save Changes".tr,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Get.toNamed(AppRoutes.patientsProfile);
                        }
                      }),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(
            currentIndex: 6,
          ),
        );
      },
    );
  }
}
