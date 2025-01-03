import 'package:dime/models/api_response_model.dart';
import 'package:dime/models/notification_model.dart';
import 'package:dime/view/common_widgets/custom_loader.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:dime/view/common_widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/notifications_controller.dart';
import '../../../../helpers/prefs_helper.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Notification".tr,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const CustomLoader(),
            Status.error => ErrorScreen(
                onTap: NotificationsController.instance.getNotificationsRepo),
            Status.completed => controller.notifications.isEmpty
                ? const NoData()
                : ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 10.sp),
                    itemCount: controller.notifications.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      NotificationModel item = controller.notifications[index];
                      return NotificationItem(
                        item: item,
                      );
                    },
                  )
          };
        },
      ),
      bottomNavigationBar: PrefsHelper.myRole == "consultant"
          ? const CustomDoctorBottomNavBar(currentIndex: 1)
          : const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
