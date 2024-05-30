import 'package:dime/core/app_routes.dart';
import 'package:dime/utils/app_icons.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class BlogItem extends StatelessWidget {
  const BlogItem(
      {super.key,
      required this.image,
      required this.name,
      required this.description,
      required this.price,
      required this.onTap});

  final String image;
  final String name;
  final String description;
  final int price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteDarkHover),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          CustomImage(
            imageSrc: image,
            imageType: ImageType.png,
            height: 96.sp,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: name,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    CustomText(
                      text: "\$ $price",
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                CustomText(
                  text: description,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  top: 6.h,
                  bottom: 8.h,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      width: 80.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          color: AppColors.secondPrimary,
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Center(
                        child: CustomText(
                          text: 'Read'.tr,
                          color: AppColors.white,
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
