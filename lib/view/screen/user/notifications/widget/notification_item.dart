import 'package:dime/extension/my_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../models/notification_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.item});

  final NotificationModel item;

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
            child: const ClipOval(
              child: Icon(
                Icons.date_range,
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
                        text: item.type,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),
                    CustomText(
                      text: item.createdAt.checkTime,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                      color: AppColors.greyLightActive,
                      maxLines: 1,
                    ),
                  ],
                ),
                CustomText(
                  text: item.message,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
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
