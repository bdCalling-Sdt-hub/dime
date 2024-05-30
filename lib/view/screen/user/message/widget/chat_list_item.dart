import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class ChatListItem extends StatelessWidget {
  ChatListItem({
    super.key,
    required this.image,
    required this.name,
    required this.message,
  });

  final String image;

  final String name;

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
      decoration: const BoxDecoration(color: AppColors.transparent),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35.sp,
                child: ClipOval(
                  child: CustomImage(
                    imageSrc: image,
                    imageType: ImageType.png,
                    height: 70.sp,
                    width: 70.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                  CustomText(
                    text: message,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ],
              ))
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          const Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
