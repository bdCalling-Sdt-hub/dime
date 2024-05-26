import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class PatientsListItem extends StatelessWidget {
  const PatientsListItem({
    super.key,
    required this.image,
    required this.name,
    required this.time,
  });

  final String image;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 120.w,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: AppColors.blueLight, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        children: [
          CustomImage(
            imageSrc: image,
            height: 100.sp,
            width: 100.sp,
            imageType: ImageType.png,
          ),
          Flexible(
            child: CustomText(
              text: name,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              top: 8.h,
              bottom: 8.h,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.list_alt_sharp,
                color: AppColors.blueNormal,
              ),
              Flexible(
                child: CustomText(
                  text: time,
                  fontSize: 12.sp,
                  left: 4.w,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
