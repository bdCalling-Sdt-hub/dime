import 'package:dime/controllers/user/chat/chat_controller.dart';
import 'package:dime/extension/my_extension.dart';
import 'package:dime/models/api_response_model.dart';
import 'package:dime/utils/app_colors.dart';
import 'package:dime/view/common_widgets/custom_loader.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:dime/view/screen/user/message/widget/active_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes.dart';
import '../../../../helpers/prefs_helper.dart';
import '../../../../models/chat_list_model.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/chat_list_item.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            text: "Inbox".tr,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          )),
      body: GetBuilder<ChatController>(
        builder: (controller) => switch (controller.status) {
          Status.loading => const CustomLoader(),
          Status.error =>
            ErrorScreen(onTap: ChatController.instance.getChatRepo),
          Status.completed => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  CustomTextField(
                      prefixIcon: const Icon(Icons.search),
                      hindText: 'search a doctor'.tr,
                      fieldBorderColor: AppColors.transparent,
                      onChanged: controller.search),
                  controller.activeUsers.isNotEmpty
                      ? CustomText(
                          text: "Active Now",
                          fontSize: 20.sp,
                          top: 20.h,
                          fontWeight: FontWeight.w700,
                        ).start
                      : 0.height,
                  Container(
                    height: controller.activeUsers.isEmpty ? 0 : 70.h,
                    padding: EdgeInsets.only(top: 8.h),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.activeUsers.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return activeUser(controller.activeUsers[index]);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.suggestions.length,
                      padding: EdgeInsets.only(top: 16.h),
                      itemBuilder: (context, index) {
                        Chat item = controller.suggestions[index];
                        return GestureDetector(
                          onTap: () =>
                              Get.toNamed(AppRoutes.message, parameters: {
                            "chatId": item.id,
                            "name": item.participant.fullName,
                            "image": item.participant.image,
                          }),
                          child: ChatListItem(
                            item: item,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        },
      ),
      bottomNavigationBar: PrefsHelper.myRole == "consultant"
          ? const CustomDoctorBottomNavBar(currentIndex: 2)
          : const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
