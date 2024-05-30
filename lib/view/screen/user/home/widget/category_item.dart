import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.item});

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.sp,
      width: 70.sp,
      decoration: BoxDecoration(
          color: AppColors.secondPrimary,
          border: Border.all(
            color: AppColors.blueLightActive,
          ),
          borderRadius:
          BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item["image"],
            color: AppColors.white,
          ),
          CustomText(
            text: item["name"],
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}
