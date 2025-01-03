import 'package:dime/extension/my_extension.dart';
import 'package:dime/utils/app_icons.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/utils/app_url.dart';
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
    required this.dateTime,
  });

  final String image;
  final String name;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 120.w,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: AppColors.greyLight, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        children: [
          CustomImage(
            imageSrc: "${AppUrls.imageUrl}$image",
            height: 100.sp,
            width: 100.sp,
            imageType: ImageType.network,
            defaultImage: AppImages.profile,
          ),
          Flexible(
            child: CustomText(
              text: name,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              textAlign: TextAlign.start,
              top: 8.h,
              bottom: 8.h,
            ).start,
          ),
          Row(
            children: [
              const CustomImage(imageSrc: AppIcons.list),
              Flexible(
                child: CustomText(
                  text: "${dateTime.dayName} ${dateTime.time}",
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
