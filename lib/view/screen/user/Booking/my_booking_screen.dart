import 'package:dime/models/api_response_model.dart';
import 'package:dime/view/common_widgets/custom_loader.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:dime/view/common_widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../controllers/user/Booking/my_booking_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../models/my_booking_model.dart';
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

  @override
  void initState() {
    controller.tabController = TabController(length: 4, vsync: this);

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
                  onTap: (value) async {
                    Future.delayed(
                      Duration.zero,
                      () => controller.getAppointmentsRepo(),
                    );
                  },
                  tabs: [
                    Tab(text: 'Upcoming'.tr),
                    Tab(text: 'Completed'.tr),
                    Tab(text: 'Confirm'.tr),
                    Tab(text: 'Pending'.tr),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: List.generate(
                      controller.tabController.length,
                      (index) {
                        switch (controller.status) {
                          case Status.loading:
                            return const CustomLoader();
                          case Status.error:
                            return ErrorScreen(
                              onTap: () => () => print("object"),
                            );
                          case Status.completed:
                            if (controller.appointmentList.isEmpty) {
                              return const NoData();
                            } else {
                              return ListView.builder(
                                itemCount: controller.appointmentList.length,
                                itemBuilder: (context, index) {
                                  var item = controller.appointmentList[index];
                                  return DoctorBookItem(
                                    date: DateFormat('MMMM d')
                                        .format(item.appointmentTime),
                                    time:
                                        "${controller.time(item.appointmentTime)} - ${controller.time(item.appointmentTime, duration: item.duration)}",
                                    image: AppImages.doctorSarah,
                                    rightButtonText: "View Details".tr,
                                    rightOnTap: () =>
                                        Get.toNamed(AppRoutes.bookingDetails),
                                    name: item.consultant.fullName,
                                  );
                                },
                              );
                            }
                          // Handle other cases if needed
                        }
                      },
                    ),
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
