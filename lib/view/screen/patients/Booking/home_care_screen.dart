import 'package:dime/view/screen/patients/Booking/widget/book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/patients/Booking/home_care_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class HomeCare extends StatelessWidget {
  HomeCare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<HomeCareController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Categories".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  bottom: 20.h,
                ),
                SizedBox(
                  height: 50.sp,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hindText: "Search".tr,
                          textStyle:
                              const TextStyle(color: AppColors.blueNormal),
                          cursorColor: AppColors.blueNormal,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColors.blueNormal,
                          ),
                          fillColor: AppColors.transparent,
                          fieldBorderColor: AppColors.blueNormal,
                        ),
                      ),
                      Container(
                        height: 50.sp,
                        width: 50.sp,
                        margin: EdgeInsets.only(left: 8.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.blueNormal,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: const Icon(
                          Icons.near_me_outlined,
                          color: AppColors.blueNormal,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BookListItem(
                        image: AppImages.doctor,
                        name: "Dr. Maria Waston",
                        address: "Heart Surgeon, London, England",
                        onTap: () => Get.toNamed(AppRoutes.selectDataHomeCare),
                      );
                    },
                  ),
                )
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
