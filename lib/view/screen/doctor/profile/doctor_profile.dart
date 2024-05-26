import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/doctor/profile/doctor_profile.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/image/custom_image.dart';
import '../../../common_widgets/item.dart';
import '../../../common_widgets/pop up/custom_pop_up_menu_button.dart';
import '../../../common_widgets/pop up/success_pop_up.dart';
import '../../../common_widgets/text/custom_text.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Doctor Details".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<DoctorProfileController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 40.sp,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: CustomImage(
                        imageSrc: AppImages.profile,
                        imageType: ImageType.png,
                        height: 80.sp,
                        width: 80.sp,
                      ),
                    ),
                  ),
                ),
                CustomText(
                  text: "Daniel Martinez",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  top: 20.h,
                  bottom: 60.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.blueLight,
                      borderRadius: BorderRadius.circular(5.r)),
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.person),
                                CustomText(
                                  text: controller.selectedInfo,
                                  color: AppColors.greyLightActive,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  left: 16.w,
                                ),
                                const Spacer(),
                                PopUpMenu(
                                    items: controller.info,
                                    selectedItem: controller.selectedInfo,
                                    isContainer: true,
                                    onTap: controller.selectLanguage)
                              ],
                            ),
                            const Divider(
                              color: AppColors.blueLightActive,
                            )
                          ],
                        ),
                      ),
                      Item(
                        icon: Icons.access_time_filled,
                        title: "Appointment History".tr,
                        vertical: 8.h,
                        disableDivider: true,
                        onTap: () => Get.toNamed(AppRoutes.appointmentHistory),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: const Divider(
                          color: AppColors.blueLightActive,
                        ),
                      ),
                      Item(
                        icon: Icons.logout,
                        title: "Log Out".tr,
                        onTap: () => PopUp.logOutPopUp(),
                        disableDivider: true,
                        vertical: 8.h,
                        color: AppColors.secondPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomDoctorBottomNavBar(currentIndex: 3),
    );
  }
}
