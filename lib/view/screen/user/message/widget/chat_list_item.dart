import 'package:dime/utils/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../models/chat_list_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class ChatListItem extends StatelessWidget {
  ChatListItem({
    super.key,
    required this.item,
  });

  final Chat item;

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
                    imageSrc: "${AppUrls.imageUrl}${item.participant.image}",
                    imageType: ImageType.network,
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
                    text: item.participant.fullName,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                  CustomText(
                    text: item.latestMessage.message,
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
