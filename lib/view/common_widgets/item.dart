import 'package:dime/view/common_widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import 'image/custom_image.dart';


class Item extends StatelessWidget {
  const Item(
      {super.key,
      this.icon,
      required this.title,
      this.image = "",
      this.disableDivider = false,
      this.onTap,
      this.color = AppColors.greyNormalActive,
      this.vertical});

  final IconData? icon;
  final String title;
  final String image;
  final bool disableDivider;
  final VoidCallback? onTap;
  final Color color;
  final double? vertical;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 24.w, vertical: vertical ?? 4.h),
        child: Column(
          children: [
            Row(
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: color,
                      )
                    : CustomImage(imageSrc: image),
                CustomText(
                  text: title,
                  color: color,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  left: 16.w,
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.sp,
                )
              ],
            ),
            disableDivider ? const SizedBox() : const Divider()
          ],
        ),
      ),
    );
  }
}
