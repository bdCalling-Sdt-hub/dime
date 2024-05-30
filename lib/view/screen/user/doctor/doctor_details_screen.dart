import 'package:dime/utils/app_icons.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/details_item.dart';
import 'widget/review_item.dart';

class DoctorDetailsScreen extends StatelessWidget {
  DoctorDetailsScreen({super.key});

  List list = ["Finance", "Marketing", "Banking"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Doctor Details".tr,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12.sp),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFFF3F4F6)),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 15,
                    offset: Offset(0, 10),
                    spreadRadius: -3,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 109.sp,
                    height: 109.sp,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AppImages.doctor),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Dr. Rodger Struck',
                            color: AppColors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            text: 'Beauty Specialist | Mercy Hospital',
                            color: AppColors.base,
                            fontSize: 14.sp,
                            maxLines: 1,
                            top: 8.h,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: 'Life is beautiful',
                            color: AppColors.base,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            top: 8.h,
                          ),
                          Container(
                            height: 25.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius:
                                    BorderRadiusDirectional.circular(4.r)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImage(
                                  imageSrc: AppIcons.clarify,
                                  height: 16.sp,
                                  width: 16.sp,
                                  imageColor: AppColors.white,
                                ),
                                CustomText(
                                  text: 'Blog',
                                  left: 4.w,
                                  color: AppColors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DetailsItem(
                  icon: Icons.group,
                  number: "2000+",
                  title: "Consultations".tr,
                ),
                DetailsItem(
                  icon: Icons.star,
                  number: "5(348)",
                  title: "rating".tr,
                ),
                DetailsItem(
                  icon: Icons.access_time_filled_sharp,
                  number: "Average 1 day".tr,
                  title: "Response".tr,
                ),
              ],
            ),
            CustomText(
              text: "About me".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              top: 20.h,
              bottom: 8.h,
            ),
            CustomText(
              text:
                  "Dr. David Patel, a dedicated cardiologist, brings a wealth of experience to Golden Gate Cardiology Center in Golden Gate",
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              maxLines: 3,
              textAlign: TextAlign.start,
            ),
            CustomText(
              text: "Where I can help".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              top: 20.h,
              bottom: 8.h,
            ),
            SizedBox(
              height: 50.h,
              child: GridView.builder(
                itemCount: list.length,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisExtent: 50.h),
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: AppColors.black)),
                      child: CustomText(text: list[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 140.h,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ReviewItem(
                    image: AppImages.emily,
                    rating: "5.0",
                    name: "Emily Anderson",
                    message:
                        "Dr. Patel is a true professional who genuinely cares about his patients. I highly recommend Dr. Patel to anyone seeking exceptional cardiac care.",
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Reviews".tr,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
                CustomText(
                  text: "See All".tr,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 60.sp,
                  padding: EdgeInsets.only(left: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.black)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone_in_talk_outlined),
                      SizedBox(
                        width: 4.w,
                      ),
                      CustomText(
                        text: "${"Video Reply".tr} \n \$30/15 sec",
                        maxLines: 2,
                      )
                    ],
                  ),
                )),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.selectDataTime),
                  child: Container(
                    height: 60.sp,
                    padding: EdgeInsets.only(left: 20.w),
                    decoration: BoxDecoration(
                      color: AppColors.secondPrimary,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.videocam_outlined,
                          color: AppColors.white,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomText(
                          text: "${"Book a call".tr} \n \$4500/15 min",
                          maxLines: 2,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 6,
      ),
    );
  }
}
