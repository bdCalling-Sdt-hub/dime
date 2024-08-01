import 'package:dime/controllers/user/chat/message_controller.dart';
import 'package:dime/core/app_routes.dart';
import 'package:dime/extension/my_extension.dart';
import 'package:dime/utils/app_icons.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';

class ChatBubbleMessage extends StatelessWidget {
  final DateTime time;
  final String text;
  final String token;
  final String channel;
  final String image;
  final bool isMe;
  final bool isEmoji;
  final int index;
  final int messageIndex;
  final bool isCall;
  final bool isNotice;
  DateTime? startTime;
  final VoidCallback onTap;

  ChatBubbleMessage({
    super.key,
    required this.time,
    required this.text,
    required this.image,
    required this.isMe,
    required this.onTap,
    this.isEmoji = false,
    this.index = 0,
    this.messageIndex = 1,
    this.token = '',
    this.channel = '',
    this.isCall = false,
    this.isNotice = false,
    this.startTime,
  });

  @override
  Widget build(BuildContext context) {
    startTime = DateTime.now().add(const Duration(days: 10));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // //=======-============================Question====================================

          isCall
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // CircleAvatar(
                    //     backgroundColor: AppColors.white,
                    //     radius: 20.sp,
                    //     child: ClipOval(
                    //         child: Image.asset(
                    //       image,
                    //       width: 36.sp,
                    //       height: 36.sp,
                    //       fit: BoxFit.fill,
                    //     ))),
                    GestureDetector(
                      onTap: MessageController.instance.checkVideoCall,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.w),
                        padding: EdgeInsets.only(left: 10.w),
                        width: 220,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            const CustomImage(
                              imageSrc: AppIcons.logo,
                              fill: BoxFit.contain,
                              height: 60,
                            ),
                            Container(
                              color: AppColors.secondPrimary,
                              width: 220,
                              child: CustomText(
                                maxLines: 5,
                                text: text,
                                fontSize: 18,
                                color: AppColors.whiteNormal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : isNotice
                  ? Center(
                      child: CustomText(
                      text: text,
                      maxLines: 1,
                      top: 8.h,
                      bottom: 8.h,
                      fontWeight: FontWeight.w700,
                    ))
                  : Row(
                      mainAxisAlignment: isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isMe == false && isCall == false)
                          CircleAvatar(
                              backgroundColor: AppColors.white,
                              radius: 20.sp,
                              child: ClipOval(
                                  child: CustomImage(
                                imageSrc: "${AppUrls.imageUrl}$image",
                                width: 36.sp,
                                height: 36.sp,
                                imageType: ImageType.network,
                              ))),
                        const SizedBox(
                          width: 8,
                        ),
                        if (isCall == false)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: isMe
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onLongPress: () {
                                    onTap();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isMe
                                          ? AppColors.blueLight
                                          : AppColors.white,
                                      border: Border.all(
                                          color: AppColors.blueLight,
                                          width: 0.5),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: CustomText(
                                      maxLines: 10,
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.w400,
                                      text: text,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                CustomText(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  text: time.time,
                                  color: AppColors.black,
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
        ],
      ),
    );
  }
}
