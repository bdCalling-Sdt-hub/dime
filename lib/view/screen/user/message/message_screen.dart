import 'package:dime/core/app_routes.dart';
import 'package:dime/extension/my_extension.dart';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controllers/user/chat/message_controller.dart';
import '../../../../models/chat_message_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
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
  String chatId = Get.parameters["chatId"] ?? "";
  String name = Get.parameters["name"] ?? "";
  String image = Get.parameters["image"] ?? "";

  @override
  void initState() {
    MessageController.instance.name = name;
    MessageController.instance.chatId = chatId;
    MessageController.instance.getMessageRepo();
    MessageController.instance.listenMessage();
    super.initState();
  }

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
                        imageSrc: "${AppUrls.imageUrl}$image",
                        imageType: ImageType.network,
                        height: 60.sp,
                        width: 60.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomText(
                    text: name,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                  const Spacer(),
                  controller.agoraToken.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            if (controller.startTime.isAfter(DateTime.now())) {
                              return;
                            }
                            Get.toNamed(AppRoutes.videoCall, parameters: {
                              "token": controller.agoraToken,
                              "channel": controller.channel
                            });
                          },
                          icon: const Icon(Icons.videocam_outlined))
                      : 0.height
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
                      ChatMessageModel message = controller.messages[index];
                      return ChatBubbleMessage(
                        index: index,
                        image: message.image,
                        isCall: message.isCall,
                        isNotice: message.isNotice,
                        time: message.time,
                        text: message.text,
                        isMe: message.isMe,
                        token: controller.agoraToken,
                        channel: controller.channel,
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
                textAlign: TextAlign.start,
                hindText: "message here".tr,
                suffixIcon: GestureDetector(
                  onTap: controller.addNewMessage,
                  child: Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: const CustomImage(
                      imageSrc: AppIcons.send,
                    ),
                  ),
                ),
                textStyle: GoogleFonts.prompt(
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black),
                fieldBorderColor: Colors.white,
                fieldBorderRadius: 8,
                controller: controller.messageController,
                onFieldSubmitted: (p0) => controller.addNewMessage(),
              ),
            ),
          ));
    });
  }
}
