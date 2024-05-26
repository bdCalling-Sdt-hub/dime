import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/image/custom_image.dart';
import '../../../common_widgets/text/custom_text.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            text: "In Review".tr,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.signIn),
                    child: const Icon(Icons.logout)),
              ),
              CustomImage(
                imageSrc: AppImages.review,
                imageType: ImageType.png,
                height: 376.sp,
              ),
              CustomText(
                text: "Your application is under review".tr,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.blueNormal,
              ),
              CustomText(
                text:
                    "We will notify you as soon as your account has been approved"
                        .tr,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                maxLines: 2,
                top: 20.h,
              ),
            ],
          ),
        ));
  }
}
