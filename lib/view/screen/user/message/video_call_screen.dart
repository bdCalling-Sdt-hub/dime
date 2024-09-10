import 'package:dime/extension/my_extension.dart';
import 'package:dime/view/common_widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/chat/video_call_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/image/custom_image.dart';
import 'widget/stream.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  String token = Get.parameters["token"] ?? "";

  String channel = Get.parameters["channel"] ?? "";

  @override
  void initState() {
    if (token.isEmpty && channel.isEmpty) {
      Future.delayed(
        const Duration(seconds: 1),
        () => Get.back(),
      );
    }
    VideoCallController.instance.token = token;
    VideoCallController.instance.channel = channel;
    VideoCallController.instance.initialize();
    super.initState();
  }

  @override
  void dispose() {
    VideoCallController.instance.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: GetBuilder<VideoCallController>(
        builder: (controller) => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              controller.remoteId != 0
                  ? remoteVideoStream(controller.remoteId, channel)
                  : Stack(
                      children: [
                        myVideoStream(controller.localUserJoined),
                        Column(
                          children: [
                            180.height,
                            Center(
                              child: CircleAvatar(
                                radius: 60.sp,
                                backgroundColor: Colors.transparent,
                                child: ClipOval(
                                  child: CustomImage(
                                    imageSrc: AppImages.profile,
                                    imageType: ImageType.png,
                                    height: 120.sp,
                                    width: 120.sp,
                                  ),
                                ),
                              ),
                            ),
                            CustomText(
                              text: "Dr. Upul",
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                              top: 12.h,
                              bottom: 12.h,
                            ),
                            // CustomText(
                            //   text: controller.callingTime != null ? DateTime.now().difference(controller.callingTime!).toString() : "",
                            //   fontSize: 18.sp,
                            //   fontWeight: FontWeight.w400,
                            // ),
                          ],
                        ),
                      ],
                    ),

              ///<<<===================Caller Image==============================>
              ///
              Positioned(
                top: controller.dragVertical,
                right: controller.dragHorizontal,
                child: GestureDetector(
                  onPanUpdate: controller.onPanUpdate,
                  child: SizedBox(
                      width: 100,
                      height: 135,
                      child: controller.localUserJoined
                          ? controller.remoteId == 0
                              ? 0.height
                              : myVideoStream(controller.localUserJoined)
                          : 0.height),
                ),
              ),

              ///<<<===================Call control bar====================>
              Positioned(
                right: 70.w,
                left: 70.w,
                bottom: 40.h,
                child: Container(
                  height: 60.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.greyLightActive,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ///==================>switch video call to audio
                      // Container(
                      //   height: 36,
                      //   width: 36,
                      //   decoration: const ShapeDecoration(
                      //     color: AppColors.black,
                      //     shape: CircleBorder(),
                      //   ),
                      //   child: InkWell(
                      //       onTap: controller.setLocalVideo,
                      //       child: Icon(
                      //         controller.localUserJoined
                      //             ? Icons.videocam_outlined
                      //             : Icons.videocam_off_outlined,
                      //         color: AppColors.white,
                      //       )),
                      // ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: const ShapeDecoration(
                          color: AppColors.black,
                          shape: CircleBorder(),
                        ),
                        child: InkWell(
                            onTap: controller.setVolume,
                            child: Icon(
                              controller.isVolume
                                  ? Icons.volume_up_outlined
                                  : Icons.volume_off_outlined,
                              color: AppColors.white,
                            )),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: const ShapeDecoration(
                          color: AppColors.black,
                          shape: CircleBorder(),
                        ),
                        child: InkWell(
                            onTap: controller.muteMic,
                            child: Icon(
                              controller.muted
                                  ? Icons.mic_off_outlined
                                  : Icons.mic_none_outlined,
                              color: AppColors.white,
                            )),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: const ShapeDecoration(
                          color: AppColors.red,
                          shape: CircleBorder(),
                        ),
                        child: InkWell(
                            onTap: controller.onCallEnd,
                            child: const Icon(
                              Icons.call_end,
                              color: AppColors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 100,
                child: Center(child: CustomText(text: controller.time)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
