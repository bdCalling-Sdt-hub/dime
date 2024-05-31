import 'package:dime/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/text/custom_text.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(
      {super.key,
      required this.title,
      required this.vale,
      this.titleColor = AppColors.whiteDarker,
      this.valueColor = AppColors.whiteDarker});

  final String title;
  final String vale;
  final Color titleColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            color: titleColor,
          ),
          CustomText(
            text: vale,
            color: valueColor,
          ),
        ],
      ),
    );
  }
}
