import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/Booking/my_booking_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
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
  String index = Get.parameters["index"] ?? "3";

  @override
  void initState() {
    controller.tabController = TabController(length: 5, vsync: this);
    controller.tabController.index = int.tryParse(index) ?? 3;
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
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  onTap: controller.selectTab,
                  tabs: [
                    Tab(text: 'Pending'.tr),
                    Tab(text: 'Payment'.tr),
                    Tab(text: 'Payment Status'.tr),
                    Tab(text: 'Upcoming'.tr),
                    Tab(text: 'Completed'.tr),
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
                              rightOnTap: () =>
                                  Get.toNamed(AppRoutes.bookingDetails),
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
                              name: "Dr. Sarah Johnson",
                              rightButtonText: "Payment".tr,
                              rightOnTap: () =>
                                  Get.toNamed(AppRoutes.paymentMethod),
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
                              rightOnTap: () =>
                                  Get.toNamed(AppRoutes.bookingDetails),
                              name: "Dr. Sarah Johnson",
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
                              rightOnTap: () =>
                                  Get.toNamed(AppRoutes.bookingDetails),
                              name: "Dr. Sarah Johnson",
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
                              rightOnTap: () =>
                                  Get.toNamed(AppRoutes.bookingDetails),
                              name: "Dr. Sarah Johnson",
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
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 9,
      ),
    );
  }
}
