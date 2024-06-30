import 'package:dime/models/active_user_model.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/app_routes.dart';

Widget activeUser(ActiveUserModel item) {
  return GestureDetector(
    onTap: () => Get.toNamed(AppRoutes.message, parameters: {
      "chatId": item.id,
      "name": item.userFullName,
      "image": AppImages.profile,
      // "image": item.image,
    }),
    child: Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Stack(
        children: [
          CustomImage(
            imageSrc: AppImages.profile,
            imageType: ImageType.png,
            height: 60.sp,
            width: 60.sp,
          ),
          Positioned(
              right: 0,
              top: 4,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50.r)),
              )),
        ],
      ),
    ),
  );
}
