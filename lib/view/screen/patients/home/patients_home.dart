import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/patients/home_controller.dart';
import '../../../../controllers/patients/profile_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/image/custom_image.dart';
import '../../../common_widgets/pop up/custom_pop_up_menu_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/list_item.dart';

class PatientsHomeScreen extends StatelessWidget {
  PatientsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeControllerPatients>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 270.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondPrimary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImage(
                            imageSrc: AppIcons.logo,
                            height: 29.h,
                            imageColor: AppColors.white,
                          ),
                          GetBuilder<ProfileController>(
                            builder: (profileController) {
                              return PopUpMenu(
                                  items: profileController.languages,
                                  iconData: Icons.g_translate,
                                  iconColor: AppColors.white,
                                  selectedItem:
                                      profileController.selectedLanguage,
                                  onTap: profileController.selectLanguage);
                            },
                          )
                        ],
                      ),
                      CustomText(
                        text: "Let’s find Health Service".tr,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w800,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        height: 50.sp,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hindText: "Ping Your Location".tr,
                                textStyle:
                                    const TextStyle(color: AppColors.greyLight),
                                cursorColor: AppColors.greyLight,
                                prefixIcon: const Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.white,
                                ),
                                fillColor: AppColors.transparent,
                              ),
                            ),
                            Container(
                              height: 50.sp,
                              width: 50.sp,
                              margin: EdgeInsets.only(left: 8.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: const Icon(
                                Icons.near_me_outlined,
                                color: AppColors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Categories".tr,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.cotegoriseList,
                                parameters: {'category': 'All'}),
                            child: CustomText(
                              text: "See All".tr,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: AppColors.whiteDarkHover,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                          height: 90.sp,
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.services.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, crossAxisSpacing: 10.sp),
                            itemBuilder: (context, index) {
                              var item = controller.services[index];
                              return GestureDetector(
                                onTap: () => Get.toNamed(
                                    AppRoutes.cotegoriseList,
                                    parameters: {'category': item['name']}),
                                child: Container(
                                  height: 70.sp,
                                  width: 70.sp,
                                  decoration: BoxDecoration(
                                      color: AppColors.secondPrimary,
                                      border: Border.all(
                                        color: AppColors.blueLightActive,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        item["image"],
                                        color: AppColors.white,
                                      ),
                                      CustomText(
                                        text: item["name"],
                                        color: AppColors.white,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Top Advisor".tr,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                          CustomText(
                            text: "See All".tr,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: AppColors.whiteDarkHover,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                          child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.doctors.length,
                        itemBuilder: (context, index) {
                          var item = controller.doctors[index];
                          return ListItem(item: item);
                        },
                      )),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
