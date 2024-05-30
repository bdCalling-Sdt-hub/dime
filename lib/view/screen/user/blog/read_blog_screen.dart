import 'package:dime/utils/app_colors.dart';
import 'package:dime/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/image/custom_image.dart';
import '../../../common_widgets/text/custom_text.dart';

class ReadBlogScreen extends StatelessWidget {
  const ReadBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Blog".tr,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            CustomText(
              text: 'Four Things Every Woman Needs To Know',
              maxLines: 2,
              fontSize: 24.sp,
              right: 70.w,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w800,
              bottom: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35.sp,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: CustomImage(
                      imageSrc: AppImages.doctorSarah,
                      imageType: ImageType.png,
                      height: 70.sp,
                      width: 70.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Dr. Emma Mia",
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                      CustomText(
                        text: "Beauty Specialist | Mecry Hospital",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.sendReview);
                    },
                    icon: const CustomImage(
                      imageSrc: AppIcons.send,
                      imageColor: AppColors.secondPrimary,
                    ))
              ],
            ),
            CustomText(
              text: 'A man’s sexuality is never your mind responsibility.',
              maxLines: 2,
              fontSize: 24.sp,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w700,
              top: 20.h,
            ),
            CustomText(
              text:
                  'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
              maxLines: 1000000,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w400,
              top: 20.h,
            ),
          ],
        ),
      ),

      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 9,
      ),
    );
  }
}
