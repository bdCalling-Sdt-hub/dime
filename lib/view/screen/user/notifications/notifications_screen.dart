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
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
            itemCount: controller.notifications.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var item = controller.notifications[index];
              return NotificationItem(
                icon: item["icon"],
                name: item["title"],
                subTitle: item["subTitle"],
                time: item["time"],
              );
            },
          );
        },
      ),
      bottomNavigationBar: PrefsHelper.userType == "doctor"
          ? const CustomDoctorBottomNavBar(currentIndex: 1)
          : const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
