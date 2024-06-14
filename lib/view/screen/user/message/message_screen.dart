import 'package:dime/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controllers/user/message_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/image/custom_image.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/chat_bubble_message.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  // String chatId = Get.parameters["chatId"] ?? "";
  // String name = Get.parameters["name"] ?? "";
  // String type = Get.parameters["type"] ?? "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.sp,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: CustomImage(
                        imageSrc: AppImages.doctorSarah,
                        imageType: ImageType.png,
                        height: 60.sp,
                        width: 60.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Katryn Murphy",
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                      CustomText(
                        text: "Therapist",
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                  const Spacer(),
                  // IconButton(
                  //     onPressed: () {
                  //       Get.toNamed(AppRoutes.sendReview);
                  //     },
                  //     icon: const Icon(Icons.videocam_outlined))
                ],
              ),
            ),
            leadingWidth: Get.width,
          ),
          body: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  reverse: true,
                  controller: controller.scrollController,
                  itemCount: controller.isMoreLoading
                      ? controller.messages.length + 1
                      : controller.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < controller.messages.length) {
                      final message = controller.messages[index];
                      return ChatBubbleMessage(
                        index: index,
                        image: message.image,
                        isCall: message.isCall,
                        isNotice: message.isNotice,
                        time: message.dateTime,
                        text: message.text,
                        isMe: message.isMe,
                        onTap: () {},
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
          bottomNavigationBar: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 24.h),
              child: CustomTextField(
                onTap: controller.getVideo,
                textAlign: TextAlign.start,
                hindText: "Upload your video document".tr,
                // prefixIcon: const Icon(Icons.videocam_outlined),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: const CustomImage(
                    imageSrc: AppIcons.send,
                  ),
                ),
                textStyle: GoogleFonts.prompt(
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black),
                fieldBorderColor: Colors.white,
                fieldBorderRadius: 8,
                controller: controller.messageController,
              ),
            ),
          ));
    });
  }
}
