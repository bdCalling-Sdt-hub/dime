import 'dart:convert';

import 'package:dime/models/api_response_model.dart';
import 'package:dime/utils/app_icons.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/view/common_widgets/custom_loader.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/consultant_details_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/details_item.dart';
import 'widget/review_item.dart';

class ConsultantDetailsScreen extends StatefulWidget {
  ConsultantDetailsScreen({super.key});

  @override
  State<ConsultantDetailsScreen> createState() =>
      _ConsultantDetailsScreenState();
}

class _ConsultantDetailsScreenState extends State<ConsultantDetailsScreen> {
  String id = Get.parameters['id'] ?? "";

  ConsultantDetailsController controller =
      Get.put(ConsultantDetailsController());

  @override
  void initState() {
    controller.getConsultantDetailsRepo(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Doctor Details".tr,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
      body: GetBuilder<ConsultantDetailsController>(
        builder: (controller) => switch (controller.status) {
          Status.loading => const CustomLoader(),
          Status.error => ErrorScreen(
              onTap: () => controller.getConsultantDetailsRepo(id),
            ),
          Status.completed => SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFFF3F4F6)),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x0C000000),
                          blurRadius: 6,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 15,
                          offset: Offset(0, 10),
                          spreadRadius: -3,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImage(
                          imageSrc:
                              "${AppUrls.imageUrl}${controller.consultantDetailsModel!.consultant.image}",
                          defaultImage: AppImages.profile,
                          borderRadius: 12.r,
                          height: 109.sp,
                          width: 109.sp,
                          imageType: ImageType.network,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.consultantDetailsModel
                                      .consultant.fullName,
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                CustomText(
                                  text:
                                      "${controller.consultantDetailsModel.consultant.category.isNotEmpty ? controller.consultantDetailsModel.consultant.category[0].name : ''} || "
                                      "${controller.consultantDetailsModel.consultant.category.length > 1 ? controller.consultantDetailsModel.consultant.category[1].name : ''}",
                                  color: AppColors.base,
                                  fontSize: 12.sp,
                                  maxLines: 1,
                                  top: 8.h,
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: controller.consultantDetailsModel
                                      .consultant.aboutMe,
                                  color: AppColors.base,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  top: 4.h,
                                  bottom: 8.h,
                                ),
                                Container(
                                  height: 25.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              4.r)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImage(
                                        imageSrc: AppIcons.clarify,
                                        height: 16.sp,
                                        width: 16.sp,
                                        imageColor: AppColors.white,
                                      ),
                                      CustomText(
                                        text: 'Blog',
                                        left: 4.w,
                                        color: AppColors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailsItem(
                        icon: Icons.group,
                        number: controller.consultantDetailsModel.consultant
                            .consultationCompleted
                            .toString(),
                        title: "Consultations".tr,
                      ),
                      DetailsItem(
                        icon: Icons.star,
                        number:
                            "${controller.consultantDetailsModel.review.ratings.averageRatings}(${controller.consultantDetailsModel.review.ratings.totalReviews})",
                        title: "Ratings".tr,
                      ),
                      DetailsItem(
                        icon: Icons.access_time_filled_sharp,
                        number:
                            "Average ${controller.calculateTime(controller.consultantDetailsModel.consultant.averageResponseTime)}"
                                .tr,
                        title: "Response".tr,
                      ),
                    ],
                  ),
                  CustomText(
                    text: "About me".tr,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    top: 20.h,
                    bottom: 8.h,
                  ),
                  CustomText(
                    text: controller.consultantDetailsModel.consultant.aboutMe,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                  ),
                  CustomText(
                    text: "Where I can help".tr,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    top: 20.h,
                    bottom: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Reviews".tr,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                      CustomText(
                        text: "See All".tr,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      height: 50.h,
                      child: GridView.builder(
                        itemCount: controller
                            .consultantDetailsModel.consultant.category.length,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisExtent: 120.h),
                        itemBuilder: (context, index) {
                          var item = controller.consultantDetailsModel
                              .consultant.category[index].name
                              .toString();
                          return Center(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(color: AppColors.black)),
                              child: CustomText(text: item),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                      height: 140.h,
                      child: ReviewItem(
                        image:
                            "${AppUrls.imageUrl}${controller.consultantDetailsModel.review.topReview.user.image}",
                        rating: controller
                            .consultantDetailsModel.review.topReview.rating
                            .toString(),
                        name: controller.consultantDetailsModel.review.topReview
                            .user.fullName,
                        message: controller
                            .consultantDetailsModel.review.topReview.comment,
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.scheduleReply),
                        child: Container(
                          height: 60.sp,
                          padding: EdgeInsets.only(left: 20.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: AppColors.black)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.phone_in_talk_outlined),
                              SizedBox(
                                width: 4.w,
                              ),
                              CustomText(
                                text:
                                    "${"Video Reply".tr} \n \$ ${controller.consultantDetailsModel.consultant.videoReplyFee} /min",
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.scheduleVideoCall,
                            parameters: {
                              "id": controller
                                  .consultantDetailsModel.consultant.id,
                              "amount": controller.consultantDetailsModel
                                  .consultant.videoConferenceFee
                                  .toString(),
                              "availability": jsonEncode(controller
                                  .consultantDetailsModel
                                  .consultant
                                  .availability
                                  .day)
                            }),
                        child: Container(
                          height: 60.sp,
                          padding: EdgeInsets.only(left: 20.w),
                          decoration: BoxDecoration(
                            color: AppColors.secondPrimary,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.videocam_outlined,
                                color: AppColors.white,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              CustomText(
                                text:
                                    "${"Book a call".tr} \n \$ ${controller.consultantDetailsModel.consultant.videoConferenceFee} /min",
                                maxLines: 2,
                                color: AppColors.white,
                              )
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 6,
      ),
    );
  }
}
