import 'package:dime/extension/my_extension.dart';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/my_booking_model.dart';
import '../../../utils/app_colors.dart';
import '../button/custom_button.dart';
import '../image/custom_image.dart';
import '../text/custom_text.dart';

Widget doctorBookItem(
    {required Appointment item,
    required String buttonText,
    VoidCallback? onTap,
    bool isLoading = false}) {
  return Container(
    padding: EdgeInsets.all(16.sp),
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.50, color: Color(0xFFF3F4F6)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x0C000000),
          blurRadius: 7,
          offset: Offset(0, 5),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 17,
          offset: Offset(0, 12),
          spreadRadius: -3,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 36.sp,
              child: ClipOval(
                child: CustomImage(
                  imageSrc: "${AppUrls.imageUrl}/${item.consultant.image}",
                  height: 72.sp,
                  width: 72.sp,
                  imageType: ImageType.network,
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: item.consultant.fullName,
                    bottom: 6.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 20.sp,
                              color: AppColors.secondPrimary,
                            ),
                            Flexible(
                              child: CustomText(
                                text: item.appointmentTime.date,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                left: 4.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              color: AppColors.secondPrimary,
                              size: 20.sp,
                            ),
                            Flexible(
                              child: CustomText(
                                text: item.appointmentTime.time,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                left: 4.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  titleText: buttonText,
                  onTap: onTap,
                  buttonHeight: 40.h,
                  buttonColor: AppColors.transparent,
                  titleColor: AppColors.greyDarker,
                  borderColor: AppColors.greyDarker,
                  titleWeight: FontWeight.w400,
                  buttonRadius: 8.r,
                  titleSize: 14.sp,
                  isLoading: isLoading,
                )),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
