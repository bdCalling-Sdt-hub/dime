import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../common_widgets/text/custom_text.dart';

class AppointmentHistoryItem extends StatelessWidget {
  const AppointmentHistoryItem({
    super.key,
    required this.time,
    required this.title,
    required this.startEndTime,
    this.disableDivider = false,
  });

  final String time;
  final String title;
  final String startEndTime;
  final bool disableDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.date_range,
              color: AppColors.secondPrimary,
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: time,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: title,
                  top: 8.h,
                  bottom: 8.h,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  text: startEndTime,
                  top: 8.h,
                  bottom: 8.h,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ))
          ],
        ),
        disableDivider ? const SizedBox() : const Divider()
      ],
    );
  }
}
