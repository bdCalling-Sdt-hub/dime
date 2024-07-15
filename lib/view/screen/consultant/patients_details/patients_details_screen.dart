import 'package:dime/models/api_response_model.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/view/common_widgets/custom_loader.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/consultant/patients_details/patients_details_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/cancel_popup.dart';
import 'package:flutter/cupertino.dart';

class PatientsDetailsScreen extends StatefulWidget {
  const PatientsDetailsScreen({super.key});

  @override
  State<PatientsDetailsScreen> createState() => _PatientsDetailsScreenState();
}

class _PatientsDetailsScreenState extends State<PatientsDetailsScreen> {
  String appointmentId = Get.parameters['appointmentId'] ?? "";

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () =>
          PatientsDetailsController.instance.getAppointmentRepo(appointmentId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Patients Details".tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<PatientsDetailsController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const CustomLoader(),
            Status.error => ErrorScreen(
                onTap: () => PatientsDetailsController.instance
                    .getAppointmentRepo(appointmentId),
              ),
            Status.completed => SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 28.h),
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
                      text: controller.appointment.subject.toString(),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomText(
                      text: 'Details'.tr,
                      fontSize: 18.sp,
                      top: 20.h,
                      bottom: 4.h,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: controller.appointment.description.toString(),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      maxLines: 5,
                      bottom: 40.h,
                      textAlign: TextAlign.start,
                    ),
                    controller.appointment.type == 'meeting'
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      textStyle: const TextStyle(
                                          color: AppColors.white),
                                      isEnabled: false,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        : Center(
                            child: controller.appointment.isAdminAccepted ==
                                        'Accepted' &&
                                    controller.appointment.paymentStatus ==
                                        'paid' &&
                                    controller.appointment.status ==
                                        "approved" &&
                                    controller.appointment.link.isEmpty
                                ? Column(
                                    children: [
                                      Container(
                                        width: Get.width * 0.8,
                                        height: 200.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            border: Border.all(
                                                color: AppColors.black)),
                                        child: controller.video.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const CustomImage(
                                                    imageSrc: AppImages.video,
                                                    imageType: ImageType.png,
                                                  ),
                                                  CustomText(
                                                      top: 12.h,
                                                      text:
                                                          'Video file uploaded'
                                                              .tr)
                                                ],
                                              )
                                            : IconButton(
                                                onPressed: controller.getVideo,
                                                icon: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                        Icons.cloud_upload),
                                                    CustomText(
                                                        text: 'Upload Video'.tr)
                                                  ],
                                                )),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      CustomButton(
                                          onTap: controller.uploadVideo,
                                          isLoading: controller.isLoadingUpload,
                                          titleText: 'Upload Video'.tr)
                                    ],
                                  )
                                : const SizedBox()),
                    SizedBox(
                      height: 120.h,
                    ),
                    controller.appointment.status == 'pending'
                        ? Row(
                            children: [
                              Expanded(
                                  child: CustomButton(
                                titleText: "Cancel".tr,
                                borderColor: AppColors.blueLightActive,
                                buttonColor: AppColors.transparent,
                                titleColor: AppColors.blueNormal,
                                onTap: () => CancelPopup.popUp(() {
                                  controller.updateAppointmentRepo(
                                      "rejected", appointmentId);
                                  Get.back();
                                }),
                              )),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                  child: CustomButton(
                                titleText: "Accept".tr,
                                isLoading: controller.isLoading == 'approved'
                                    ? true
                                    : false,
                                onTap: () {
                                  controller.updateAppointmentRepo(
                                      "approved", appointmentId);
                                },
                              ))
                            ],
                          )
                        : const SizedBox(),
                    controller.appointment.paymentStatus == "paid"
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(
                                CupertinoIcons.chat_bubble_text_fill))
                        : const SizedBox()
                  ],
                ),
              ),
          };
        },
      ),
      bottomNavigationBar: const CustomDoctorBottomNavBar(currentIndex: 9),
    );
  }
}
