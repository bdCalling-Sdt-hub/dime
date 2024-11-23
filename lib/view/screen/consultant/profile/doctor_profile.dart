import 'package:dime/helpers/prefs_helper.dart';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/consultant/profile/doctor_profile.dart';
import '../../../../core/app_routes.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/image/custom_image.dart';
import '../../../common_widgets/item.dart';
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
                        imageSrc: "${AppUrls.imageUrl}${PrefsHelper.myImage}",
                        imageType: ImageType.network,
                        height: 80.sp,
                        width: 80.sp,
                      ),
                    ),
                  ),
                ),
                CustomText(
                  text: PrefsHelper.myName,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  top: 20.h,
                  bottom: 60.h,
                ),
                Item(
                  icon: Icons.person_outlined,
                  title: "Edit Profile".tr,
                  onTap: () => Get.toNamed(AppRoutes.personalInformation,
                      parameters: {'type': 'back'}),
                ),
                Item(
                  icon: Icons.access_time,
                  title: "Availability".tr,
                  onTap: () => Get.toNamed(AppRoutes.availability,
                      parameters: {'type': 'back'}),
                ),
                Item(
                  icon: Icons.settings_outlined,
                  title: "Booking Records".tr,
                  onTap: () => Get.toNamed(AppRoutes.myBooking),
                ),
                Item(
                  icon: Icons.payments_outlined,
                  title: "Transactions".tr,
                  onTap: () => Get.toNamed(AppRoutes.transactions),
                ),
                Item(
                  icon: Icons.broken_image_outlined,
                  title: "Upload Blogs".tr,
                  onTap: () => Get.toNamed(AppRoutes.uploadBlog),
                ),
                Item(
                  icon: Icons.broken_image_outlined,
                  title: "My Blog".tr,
                  onTap: () => Get.toNamed(AppRoutes.myBlog),
                ),
                Item(
                  icon: Icons.settings_outlined,
                  title: "Settings".tr,
                  onTap: () => Get.toNamed(AppRoutes.setting),
                ),
                Item(
                  icon: Icons.logout,
                  title: "Log Out".tr,
                  onTap: () => PopUp.logOutPopUp(),
                  disableDivider: true,
                  disableIcon: true,
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
