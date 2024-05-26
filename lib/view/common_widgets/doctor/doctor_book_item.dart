import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../button/custom_button.dart';
import '../image/custom_image.dart';
import '../text/custom_text.dart';


class DoctorBookItem extends StatelessWidget {
  DoctorBookItem({
    super.key,
    required this.dataTime,
    required this.image,
    required this.name,
    required this.title,
    required this.address,
    this.rightButtonText = "",
    this.leftButtonText = "",
    this.rightOnTap,
    this.leftOnTap,
    this.leftIsLoading = false,
    this.rightIsLoading = false,
    this.noButton = false,
  });

  final String dataTime;
  final String image;
  final String name;
  final String title;
  final String address;
  final String rightButtonText;
  final String leftButtonText;
  final VoidCallback? rightOnTap;
  final VoidCallback? leftOnTap;
  final bool leftIsLoading, rightIsLoading, noButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFF3F4F6)),
          borderRadius: BorderRadius.circular(12.r),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 7,
            offset: Offset(0, 5),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 17,
            offset: Offset(0, 12),
            spreadRadius: -3,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: dataTime,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            bottom: 4.h,
          ),
          const Divider(),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              CustomImage(
                imageSrc: image,
                height: 120.sp,
                width: 120.sp,
                imageType: ImageType.png,
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                  CustomText(
                    text: title,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    top: 8.h,
                    bottom: 8.h,
                    color: AppColors.blueNormal,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        color: AppColors.secondPrimary,
                        size: 20.sp,
                      ),
                      CustomText(
                        text: address,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        left: 4.w,
                        color: AppColors.blueNormal,
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
          noButton
              ? const SizedBox()
              : Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomButton(
                          titleText: leftButtonText,
                          onTap: leftOnTap,
                          buttonHeight: 40.h,
                          buttonColor: AppColors.transparent,
                          titleColor: AppColors.greyDarker,
                          borderColor: AppColors.greyDarker,
                          titleWeight: FontWeight.w600,
                          isLoading: leftIsLoading,
                        )),
                        SizedBox(
                          width: 18.w,
                        ),
                        Expanded(
                            child: CustomButton(
                          titleText: rightButtonText,
                          onTap: rightOnTap,
                          buttonHeight: 40.h,
                          isLoading: rightIsLoading,
                        )),
                      ],
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
