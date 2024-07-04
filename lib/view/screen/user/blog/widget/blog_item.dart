import 'package:dime/core/app_routes.dart';
import 'package:dime/utils/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/user/payment/payment_controller.dart';
import '../../../../../controllers/user/payment/select_payment_method_controller.dart';
import '../../../../../models/blogs_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.item});

  final Blog item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteDarkHover),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          CustomImage(
            imageSrc: "${AppUrls.imageUrl}/${item.image}",
            imageType: ImageType.network,
            height: 96.sp,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: item.title,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    CustomText(
                      text: "\$${item.price}",
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                CustomText(
                  text: item.details,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  top: 6.h,
                  bottom: 8.h,
                ),
                GestureDetector(
                  onTap: () {
                    if (item.isPaymentDone) {
                      Get.toNamed(AppRoutes.readBlog);
                    } else {
                      SelectPaymentMethodController.instance.amount =
                          item.price.toString();
                      SelectPaymentMethodController.instance.productName =
                          'Appointment';
                      PaymentController.instance.consultant = item.id;
                      PaymentController.instance.appointment = item.id;
                      PaymentController.instance.amountController.text =
                          item.price.toString();
                      Get.toNamed(AppRoutes.paymentMethod);
                    }
                  },
                  child: Container(
                      width: 80.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          color: AppColors.secondPrimary,
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Center(
                        child: CustomText(
                          text: item.isPaymentDone ? 'Read'.tr : 'buy'.tr,
                          color: AppColors.white,
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
