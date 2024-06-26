import 'package:dime/utils/app_icons.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.item, required this.onTap});

  final Map item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteDarkHover),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          CustomImage(
            imageSrc: item["image"],
            imageType: ImageType.png,
            height: 62.sp,
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
                      text: item["name"],
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    CustomText(
                      text: "\$ ${item["price"].toString()}",
                    ),
                  ],
                ),
                CustomText(
                  text: item["categories"],
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                ),
                Row(
                  children: [
                    CustomText(text: item["rating"].toString()),
                    const Icon(
                      Icons.star,
                      color: AppColors.orange,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    const CustomImage(imageSrc: AppIcons.chat),
                    CustomText(
                      text: item["chat"].toString(),
                      left: 6.w,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.secondPrimary,
                              borderRadius: BorderRadius.circular(6.r)),
                          width: 80.w,
                          height: 24.h,
                          child: Center(
                            child: CustomText(
                              text: "Book".tr,
                              color: AppColors.white,
                              fontSize: 12.sp,
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
