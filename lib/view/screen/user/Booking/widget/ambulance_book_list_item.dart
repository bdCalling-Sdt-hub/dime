import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class AmbulanceBookListItem extends StatelessWidget {
  const AmbulanceBookListItem(
      {super.key,
      required this.image,
      required this.name,
      required this.address,
      this.onTap});

  final String image;
  final String name;
  final String address;
  final VoidCallback? onTap;

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
                CustomText(
                  text: name,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
                CustomText(
                  text: address,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  color: AppColors.secondPrimary,
                  bottom: 10.h,
                  top: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: onTap,
                        child: Container(
                          height: 40.sp,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                              color: AppColors.blueLight,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone_in_talk_outlined,
                                size: 20.sp,
                              ),
                              CustomText(
                                text: "Call for booking".tr,
                                fontSize: 14.sp,
                                left: 10.w,
                                color: AppColors.blueNormal,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: 50.sp,
                        height: 40.sp,
                        margin: EdgeInsets.only(left: 16.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 8.sp),
                        decoration: BoxDecoration(
                            color: AppColors.blueLight,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: CustomImage(
                          imageSrc: AppIcons.chat,
                          height: 24.sp,
                          width: 24.sp,
                        ))
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
