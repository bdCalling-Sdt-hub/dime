import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';


class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key,
      required this.icon,
      required this.name,
      required this.subTitle,
      required this.time,
      this.onTap});

  final IconData icon;
  final String name;
  final String subTitle;
  final String time;
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
          CircleAvatar(
            backgroundColor: AppColors.blueLightHover,
            radius: 35.r,
            child: ClipOval(
              child: Icon(
                icon,
                color: AppColors.secondPrimary,
              ),
            ),
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
                    Flexible(
                      child: CustomText(
                        text: name,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),
                    CustomText(
                      text: time,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                      color: AppColors.greyLightActive,
                      maxLines: 1,
                    ),
                  ],
                ),
                CustomText(
                  text: subTitle,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  maxLines: 2,
                  color: AppColors.greyLightActive,
                  textAlign: TextAlign.start,
                  bottom: 10.h,
                  top: 4.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
