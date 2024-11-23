import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({
    super.key,
    required this.image,
    required this.name,
    required this.title,
    required this.rating,
  });

  final String image;
  final String name;
  final String title;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.only(
        bottom: 16.sp,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 0.5.w),
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        children: [
          CustomImage(
            imageSrc: image,
            height: 55.sp,
            width: 55.sp,
            imageType: ImageType.png,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: name,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                  const Spacer(),
                  CustomText(
                    text: rating,
                    color: AppColors.secondPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                  const Icon(
                    Icons.star,
                    color: AppColors.secondPrimary,
                  )
                ],
              ),
              CustomText(
                text: title,
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                color: AppColors.blueNormal,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
