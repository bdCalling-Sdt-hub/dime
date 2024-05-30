import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes.dart';
import '../../../../helpers/prefs_helper.dart';
import '../../../../utils/app_images.dart';
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
            text: "Messages".tr,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            CustomTextField(
              prefixIcon: const Icon(Icons.search),
              hindText: 'search a doctor'.tr,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.only(top: 16.h),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.message),
                    child: ChatListItem(
                      image: AppImages.doctorSarah,
                      name: "Favour Nwaeze",
                      message: "Hello Ken, Hope you are doing great",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PrefsHelper.userType == "doctor"
          ? const CustomDoctorBottomNavBar(currentIndex: 2)
          : const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
