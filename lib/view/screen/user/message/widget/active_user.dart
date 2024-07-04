import 'package:dime/controllers/user/chat/chat_controller.dart';
import 'package:dime/models/active_user_model.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget activeUser(ActiveUserModel item) {
  return GestureDetector(
    onTap: () => ChatController.instance.addChatRoom(item),
    child: Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Stack(
        children: [
          CustomImage(
            imageSrc: "${AppUrls.imageUrl}/${item.image}",
            imageType: ImageType.network,
            height: 60.sp,
            width: 60.sp,
          ),
          Positioned(
              right: 0,
              top: 4,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50.r)),
              )),
        ],
      ),
    ),
  );
}
