import 'package:dime/helpers/prefs_helper.dart';
import 'package:dime/models/api_response_model.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:dime/view/common_widgets/video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/user/Booking/booking_details_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  String id = Get.parameters['id'] ?? "";

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => BookingDetailsController.instance.getAppointmentDetailsRepo(id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "User Booking Details".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<BookingDetailsController>(
        builder: (controller) => switch (controller.status) {
          Status.loading => const CircularProgressIndicator(),
          Status.error => ErrorScreen(
              onTap: () => controller.getAppointmentDetailsRepo(id),
            ),
          Status.completed => SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Subject'.tr,
                    fontSize: 18.sp,
                    top: 20.h,
                    bottom: 4.h,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: controller.appointmentDetails.data.attributes.subject,
                    fontWeight: FontWeight.w400,
                  ),

                  CustomText(
                    text: 'Details'.tr,
                    fontSize: 18.sp,
                    top: 20.h,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: controller
                        .appointmentDetails.data.attributes.description,
                    fontWeight: FontWeight.w400,
                    maxLines: 5,
                    textAlign: TextAlign.start,
                  ),

                  CustomText(
                    text: 'Type'.tr,
                    fontSize: 18.sp,
                    top: 20.h,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: controller.appointmentDetails.data.attributes.type,
                    fontWeight: FontWeight.w400,
                    maxLines: 5,
                    textAlign: TextAlign.start,
                  ),

                  CustomText(
                    text: 'Amount'.tr,
                    fontSize: 18.sp,
                    top: 20.h,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text:
                        "\$${controller.appointmentDetails.data.attributes.amount}",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    maxLines: 5,
                    textAlign: TextAlign.start,
                  ),

                  controller.appointmentDetails.data.attributes.type ==
                          'meeting'
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Call Duration".tr,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                ),
                                SizedBox(
                                  width: 150.w,
                                  child: CustomTextField(
                                    controller:
                                        controller.callDurationController,
                                    fillColor: AppColors.black,
                                    textAlign: TextAlign.center,
                                    hindText: 'Call Duration'.tr,
                                    textStyle:
                                        const TextStyle(color: AppColors.white),
                                    isEnabled: false,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: "Booking Date".tr,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.sp,
                                        top: 40.h,
                                        bottom: 12.h,
                                      ),
                                      CustomTextField(
                                        controller:
                                            controller.bookingDateController,
                                        fillColor: AppColors.transparent,
                                        hindText: 'Booking Date'.tr,
                                        fieldBorderRadius: 6.r,
                                        isEnabled: false,
                                        fieldBorderColor:
                                            AppColors.secondPrimary,
                                        suffixIcon:
                                            const Icon(Icons.date_range),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Booking Time".tr,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.sp,
                                        top: 40.h,
                                        bottom: 12.h,
                                      ),
                                      CustomTextField(
                                        controller:
                                            controller.bookingTimeController,
                                        fillColor: AppColors.transparent,
                                        hindText: 'Booking Time'.tr,
                                        fieldBorderRadius: 6.r,
                                        fieldBorderColor:
                                            AppColors.secondPrimary,
                                        isEnabled: false,
                                        suffixIcon:
                                            const Icon(Icons.access_time),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            const MyVideoPlayer(
                                videoUrl:
                                    'http://103.145.138.74:3000/uploads/videos/1000001253-1720843986424.mp4'),
                          ],
                        ),

                  controller.appointmentDetails.data.attributes.paymentStatus ==
                          "paid"
                      ? Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            CustomButton(
                                onTap: () => controller.addChatRoom(
                                    PrefsHelper.myRole == "consultant"
                                        ? controller.appointmentDetails.data
                                            .attributes.user.id
                                        : controller.appointmentDetails.data
                                            .attributes.consultant.id),
                                titleText: 'Message'.tr),
                          ],
                        )
                      : const SizedBox(),

                  SizedBox(height: 36.h),

                  // CustomButton(
                  //   titleText: "Join".tr,
                  //   titleSize: 24.sp,
                  //   onTap: () => Get.toNamed(AppRoutes.videoCall),
                  // )
                ],
              ),
            ),
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 9,
      ),
    );
  }
}
