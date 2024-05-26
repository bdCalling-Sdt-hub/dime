import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/doctor/info/identification_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/upload.dart';

class IdentificationScreen extends StatelessWidget {
  const IdentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Confirm your Identity".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<IdentificationController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Upload your certificate documents".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  top: 20.h,
                  bottom: 12.h,
                ),
                GestureDetector(
                  onTap: controller.openCertification,
                  child: Upload(
                    image: controller.certification,
                  ),
                ),
                CustomText(
                  text: "Upload your NID/Passport documents".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  top: 20.h,
                  bottom: 12.h,
                ),
                GestureDetector(
                  onTap: controller.openPassport,
                  child: Upload(
                    image: controller.passport,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    titleText: "Done".tr,
                    onTap: () => Get.toNamed(AppRoutes.reviewScreen)),
              ],
            ),
          );
        },
      ),
    );
  }
}
