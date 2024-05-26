import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_icons.dart';
import '../../../common_widgets/item.dart';
import '../../../common_widgets/text/custom_text.dart';

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "My Booking".tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Item(
              image: AppIcons.stethoscope,
              title: "Doctor Booking".tr,
              onTap: () => Get.toNamed(AppRoutes.myBooking),
            ),
            Item(
              image: AppIcons.lab,
              title: "Laboratory Test Booking".tr,
              onTap: () => Get.toNamed(AppRoutes.myBooking),
            ),
            Item(
              image: AppIcons.ambulance,
              title: "Ambulance".tr,
              onTap: () => Get.toNamed(AppRoutes.myBooking),
            ),
            Item(
              image: AppIcons.homeCare,
              title: "Home Care Booking",
              onTap: () => Get.toNamed(AppRoutes.myBooking),
              disableDivider: true,
            ),
          ],
        ),
      ),
    );
  }
}
