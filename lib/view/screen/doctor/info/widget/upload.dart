import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';

class Upload extends StatelessWidget {
  const Upload({super.key, required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 0.5),
          borderRadius: BorderRadius.circular(6.r)),
      child: image != null
          ? Image.file(File(image!))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add),
                CustomText(
                  text: "Upload".tr,
                  fontSize: 24.sp,
                )
              ],
            ),
    );
  }
}
