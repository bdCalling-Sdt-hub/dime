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
import 'widget/booking_list.dart';

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
                  tabAlignment: TabAlignment.start,
                  onTap: controller.selectTab,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  onTap: (value) async {
                    Future.delayed(
                      Duration.zero,
                      () => controller.getAppointmentsRepo(),
                    );
                  },
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
                      children: const [
                        BookingList(),
                        BookingList(),
                        BookingList(),
                        BookingList(),
                      ]),
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
