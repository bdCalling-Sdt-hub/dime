import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';

class HourItem extends StatelessWidget {
  const HourItem({super.key, required this.title, required this.isSelected});

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.blueLight,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.transparent, width: 0.5)),
      child: Center(
        child: CustomText(
          text: title,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: isSelected ? AppColors.white : AppColors.blueNormal,
        ),
      ),
    );
  }
}
