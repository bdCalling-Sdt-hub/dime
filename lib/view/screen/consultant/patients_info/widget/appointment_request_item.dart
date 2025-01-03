import 'package:dime/extension/my_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';

class AppointmentRequestItem extends StatelessWidget {
  const AppointmentRequestItem(
      {super.key, required this.dateTime, required this.text});

  final DateTime dateTime;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 22.h),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
          color: AppColors.greyLight, borderRadius: BorderRadius.circular(4.r)),
      child: Row(
        children: [
          const Icon(
            Icons.date_range,
            color: AppColors.secondPrimary,
          ),
          SizedBox(
            width: 8.w,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "${dateTime.dayName} ${dateTime.time}",
                fontSize: 18.sp,
                color: AppColors.secondPrimary,
              ),
              CustomText(
                text: text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
