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
  const DoctorDetailsScreen({super.key});

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Dr. Rodger Struck',
                                color: AppColors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              const Icon(Icons.mail_outline)
                            ],
                          ),
                          const SizedBox(height: 8),
                          CustomText(
                            text: 'Cardiologist',
                            color: AppColors.greyLightActive,
                            fontSize: 14.sp,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_on_outlined),
                              const SizedBox(width: 4),
                              Flexible(
                                child: SizedBox(
                                  child: CustomText(
                                    text: 'Golden Cardiology Center',
                                    color: AppColors.greyLightActive,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                  title: "patients",
                ),
                DetailsItem(
                  icon: Icons.workspace_premium_sharp,
                  number: "10+",
                  title: "experience",
                ),
                DetailsItem(
                  icon: Icons.star,
                  number: "5",
                  title: "rating",
                ),
                DetailsItem(
                  icon: Icons.sms,
                  number: "1872",
                  title: "reviews",
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
              text: "Working Time".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              top: 20.h,
              bottom: 8.h,
            ),
            CustomText(
              text: "Monday-Friday, 08.00 AM-18.00 pM",
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              textAlign: TextAlign.start,
              bottom: 20.h,
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
            SizedBox(
              height: 16.h,
            ),
            CustomButton(
              titleText: "Book Appointment".tr,
              onTap: () => Get.toNamed(AppRoutes.bookAppointment),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 6,
      ),
    );
  }
}
