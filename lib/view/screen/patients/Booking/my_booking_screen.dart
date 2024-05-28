import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/patients/Booking/my_booking_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/doctor/doctor_book_item.dart';
import '../../../common_widgets/text/custom_text.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen>
    with SingleTickerProviderStateMixin {
  MyBookingController controller = Get.put(MyBookingController());

  @override
  void initState() {
    controller.tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "My Booking".tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
        child: GetBuilder<MyBookingController>(
          builder: (controller) {
            return Column(
              children: [
                TabBar(
                  indicatorColor: AppColors.black,
                  controller: controller.tabController,
                  labelColor: AppColors.black,
                  unselectedLabelColor: Colors.black,
                  onTap: controller.selectTab,
                  tabs: [
                    Tab(text: 'Upcoming'.tr),
                    Tab(text: 'Completed'.tr),
                    Tab(text: 'Canceled'.tr),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      Center(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return DoctorBookItem(
                                date: "Monday,March 12",
                                time: "11:00 - 12:00 AM",
                                image: AppImages.doctorSarah,
                                name: "Dr. Sarah Johnson",
                                rightButtonText: "View Details".tr,
                                leftButtonText: "Cancel".tr,
                                rightOnTap: () => print("kjfsd"),
                                leftOnTap: () => print("kjfsd"));
                          },
                        ),
                      ),
                      Center(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return DoctorBookItem(
                              date: "March 12",
                              time: "11:00 - 12:00 AM",
                              image: AppImages.doctorSarah,
                              name: "Dr. Sarah Johnson",
                              rightButtonText: "Re-Schedule".tr,
                              noButton: true,
                              rightOnTap: () =>
                                  Get.toNamed(AppRoutes.sendReview),
                            );
                          },
                        ),
                      ),
                      Center(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return DoctorBookItem(
                              date: "March 12",
                              time: "11:00 - 12:00 AM",
                              image: AppImages.doctorSarah,
                              rightButtonText: "View Details".tr,
                              rightOnTap: () => print("jkfkjhdf"),
                              name: "Dr. Sarah Johnson",
                              noButton: true,
                            );
                          },
                        ),
                      ),
                    ],
                    // Specify the controller here
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
