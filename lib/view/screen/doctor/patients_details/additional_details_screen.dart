import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/doctor/patients_details/patients_details_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/image/custom_image.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class AdditionalDetailsScreen extends StatelessWidget {
  const AdditionalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Patients Details".tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<PatientsDetailsController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.sp,
                      child: ClipOval(
                        child: CustomImage(
                          imageSrc: AppImages.doctorSarah,
                          height: 60.sp,
                          imageType: ImageType.png,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Farvez Abdullah",
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                        ),
                        CustomText(
                          text: "Rampura, Dhaka, Bangladessh",
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                        ),
                      ],
                    )),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.message),
                      child: CustomImage(
                        imageSrc: AppIcons.chat,
                        height: 30.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(6.sp),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.blueNormal),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: CustomImage(
                          imageSrc: AppImages.records,
                          imageType: ImageType.png,
                          height: 230.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(6.sp),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.blueNormal),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: CustomImage(
                          imageSrc: AppImages.records,
                          imageType: ImageType.png,
                          height: 230.h,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomText(
                  text: "Additional details".tr,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  top: 32.h,
                  bottom: 20.h,
                ),
                CustomTextField(
                  controller: controller.descriptionController,
                  isEnabled: false,
                  maxLines: 3,
                  fieldBorderRadius: 4.r,
                  hindText: "Additional details information".tr,
                  fieldBorderColor: AppColors.transparent,
                  fillColor: AppColors.blueLight,
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomDoctorBottomNavBar(currentIndex: 9),
    );
  }
}
