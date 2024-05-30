import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import '../../../../controllers/user/send_review_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class SendReview extends StatelessWidget {
  const SendReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Ratings".tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<SendReviewController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: "4.8",
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                            ),
                            Icon(Icons.star)
                          ],
                        ),
                        CustomText(
                          text:
                              "1,64,002 Ratings \n & \n ${controller.totalRating} Reviews",
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          maxLines: 3,
                          top: 8.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Expanded(
                      child: Column(
                          children: List.generate(
                        controller.ratings.length,
                        (index) {
                          return Row(
                            children: [
                              CustomText(
                                  text: "${controller.ratings.length - index}"),
                              RatingBarIndicator(
                                rating: 5,
                                itemBuilder: (context, i) => const Icon(
                                  Icons.star,
                                  color: AppColors.greyLightActive,
                                ),
                                itemCount: 1,
                                itemSize: 24.sp,
                                direction: Axis.vertical,
                              ),
                              Expanded(
                                child: LinearProgressBar(
                                  maxSteps: 100,

                                  progressType:
                                      LinearProgressBar.progressTypeLinear,
                                  // Use Linear progress
                                  currentStep: controller.rating(index),

                                  progressColor: AppColors.blueNormal,
                                  backgroundColor: AppColors.greyLightActive,
                                ),
                              ),
                              SizedBox(
                                width: 36.w,
                              )
                            ],
                          );
                        },
                      )),
                    )
                  ],
                ),
                CustomText(
                  text: "What is your rate".tr,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  top: 14.h,
                  bottom: 14.h,
                ),
                RatingBar.builder(
                  initialRating: 3.5,
                  itemCount: 5,
                  glowColor: AppColors.secondPrimary,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star_border,
                      color: AppColors.secondPrimary,
                    );
                  },
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                CustomText(
                  text: "Please share your opinion about the product".tr,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  top: 14.h,
                  bottom: 20.h,
                ),
                CustomTextField(
                  hindText: "Your review".tr,
                  fieldBorderRadius: 4.r,
                  fillColor: AppColors.blueLight,
                  controller: controller.reviewController,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(titleText: "Send Review".tr)
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 6,
      ),
    );
  }
}
