import 'package:dime/utils/app_colors.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/view/common_widgets/bottom%20nav%20bar/doctor_nav_bar.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:dime/view/screen/consultant/transaction/widget/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/text/custom_text.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Transactions".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomImage(
                  imageSrc: AppImages.doctorSarah,
                  imageType: ImageType.png,
                  height: 86.h,
                  width: 140.w,
                  fill: BoxFit.contain,
                ),
                const Expanded(
                    child: Column(
                  children: [
                    TransactionItem(
                      title: "Full Name:",
                      vale: "Jane Cooper",
                      valueColor: AppColors.greyNormalActive,
                    ),
                    TransactionItem(
                      title: "Phone number:",
                      vale: "(319) 555-0115",
                      valueColor: AppColors.greyNormalActive,
                    ),
                    TransactionItem(
                      title: "Email:",
                      vale: "abc@example.com",
                      valueColor: AppColors.greyNormalActive,
                    )
                  ],
                )),
              ],
            ),
            CustomText(
              text: "Transaction details:".tr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              top: 40.h,
              bottom: 14.h,
            ),
            TransactionItem(title: "Transaction ID:".tr, vale: "123456789"),
            TransactionItem(title: "A/C holder name:".tr, vale: "Wade Warren"),
            TransactionItem(title: "A/C number:".tr, vale: "********4560"),
            TransactionItem(title: "Received amount:".tr, vale: "\$500"),
          ],
        ),
      ),
      bottomNavigationBar: const CustomDoctorBottomNavBar(currentIndex: 9),
    );
  }
}
