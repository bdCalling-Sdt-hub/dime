import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';


class DoctorListItem extends StatelessWidget {
  DoctorListItem({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.address,
  });

  final String image;

  final String name;

  final String rating;

  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.blueLightHover)),
      child: Row(
        children: [
          CustomImage(
            imageSrc: image,
            imageType: ImageType.png,
            height: 96.sp,
            width: 96.sp,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: name,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    CustomText(
                      text: rating,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                CustomText(
                  text: address,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  bottom: 10.h,
                  top: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 6.h),
                        decoration: BoxDecoration(
                            color: AppColors.blueLight,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: CustomText(
                          text: "Appointment",
                          fontSize: 14.sp,
                          color: AppColors.blueNormal,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                          color: AppColors.blueLight,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Icon(
                        Icons.mail_outline_outlined,
                        size: 20.sp,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                          color: AppColors.blueLight,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Icon(
                        Icons.favorite_border,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
