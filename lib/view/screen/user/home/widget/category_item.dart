import 'package:dime/models/category_model.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.item});

  final CategoryModel item;

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
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(
            imageSrc: "${AppUrls.imageUrl}${item.image}",
            imageType: ImageType.network,
            height: 30,
            width: 30,
            borderRadius: 4,
          ),
          CustomText(
            text: item.name,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}
