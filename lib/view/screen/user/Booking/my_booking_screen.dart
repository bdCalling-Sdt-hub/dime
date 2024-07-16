import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/Booking/my_booking_controller.dart';
import '../../../../helpers/prefs_helper.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
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
    controller.getAppointmentsRepo();

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
                  onTap: (value) async {
                    Future.delayed(
                      Duration.zero,
                      () {
                        controller.page = 1;
                        controller.getAppointmentsRepo();
                      },
                    );
                  },
                  tabs: [
                    Tab(text: 'Pending'.tr),
                    Tab(text: 'Payment'.tr),
                    Tab(text: 'Upcoming'.tr),
                    Tab(text: 'Completed'.tr),
                    Tab(text: 'Cancelled'.tr),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        BookingList(
                          buttonText: 'view Details'.tr,
                        ),
                        BookingList(
                          buttonText: 'payment'.tr,
                          isPayment: true,
                        ),
                        BookingList(
                          buttonText: 'view Details'.tr,
                        ),
                        BookingList(
                          buttonText: 'view Details'.tr,
                        ),
                        BookingList(
                          buttonText: 'view Details'.tr,
                        ),
                      ]),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: PrefsHelper.myRole == "consultant"
          ? const CustomDoctorBottomNavBar(currentIndex: 9)
          : const CustomBottomNavBar(
              currentIndex: 9,
            ),
    );
  }
}
