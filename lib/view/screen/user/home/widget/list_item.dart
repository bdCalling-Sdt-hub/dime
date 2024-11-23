import 'package:dime/utils/app_icons.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../models/consultant_list_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.item, required this.onTap});

  final ConsultantListModel item;
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
            imageSrc: "${AppUrls.imageUrl}${item.image}",
            imageType: ImageType.network,
            defaultImage: AppImages.profile,
            height: 62.sp,
            width: 62.sp,
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
                      text: item.fullName,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    CustomText(
                      text: "\$ ${item.videoConferenceFee.toString()}",
                    ),
                  ],
                ),
                CustomText(
                  text: item.category.isNotEmpty ? item.category[0].name : "",
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                ),
                Row(
                  children: [
                    CustomText(text: item.ratings.toString()),
                    const Icon(
                      Icons.star,
                      color: AppColors.orange,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    const CustomImage(imageSrc: AppIcons.chat),
                    CustomText(
                      text: item.consultationCompleted.toString(),
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
