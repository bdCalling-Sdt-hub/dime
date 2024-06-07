import 'package:dime/utils/app_colors.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:dime/view/common_widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width * 1.1,
        height: Get.height * 1.1,
        color: AppColors.blueLightActive,
        child: CustomImage(
          imageSrc:
              "https://cdn.neow.in/news/images/uploaded/2020/08/1597425713_telegram_video_calls.jpg",
          imageType: ImageType.network,
          width: Get.width * 1.5,
          height: Get.height * 1.5,
          fill: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
