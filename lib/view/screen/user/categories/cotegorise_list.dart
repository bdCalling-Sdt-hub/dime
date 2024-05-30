import 'package:dime/view/common_widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/category_list_controller.dart';
import '../../../../controllers/user/home_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/doctor_list_item.dart';

class CategoriseListScreen extends StatefulWidget {
  CategoriseListScreen({super.key});

  @override
  State<CategoriseListScreen> createState() => _CategoriseListScreenState();
}

class _CategoriseListScreenState extends State<CategoriseListScreen> {
  HomeControllerPatients homeControllerPatients =
      Get.put(HomeControllerPatients());

  CategoryListController controller = Get.put(CategoryListController());

  @override
  void initState() {
    controller.selectedCategory = Get.parameters['category'] ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<CategoryListController>(
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
                            cursorColor: AppColors.blueNormal,
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                            fillColor: AppColors.transparent,
                            fieldBorderColor: AppColors.black,
                          ),
                        ),
                        Container(
                          height: 50.sp,
                          width: 50.sp,
                          margin: EdgeInsets.only(left: 8.w),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.black,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r))),
                          child: const Icon(
                            Icons.near_me_outlined,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeControllerPatients.services.length + 1,
                      itemBuilder: (context, index) {
                        var item = index == 0
                            ? {"name": "All"}
                            : homeControllerPatients.services[index - 1];
                        return GestureDetector(
                            onTap: () =>
                                controller.selectCategory(item['name']),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.sp,
                                    horizontal: index == 0 ? 16.sp : 8.sp),
                                margin: EdgeInsets.only(left: 8.w),
                                decoration: BoxDecoration(
                                    color: controller.selectedCategory !=
                                            item['name']
                                        ? AppColors.transparent
                                        : AppColors.secondPrimary,
                                    border: Border.all(
                                        color: controller.selectedCategory !=
                                                item['name']
                                            ? AppColors.greyDark
                                            : AppColors.transparent),
                                    borderRadius: BorderRadius.circular(
                                      8.sp,
                                    )),
                                child: CustomText(
                                  text: item['name'],
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: controller.selectedCategory !=
                                          item['name']
                                      ? AppColors.black
                                      : AppColors.secondary,
                                )));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    child: controller.isLoading
                        ? SizedBox(height: 200.h, child: const CustomLoader())
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.doctors.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(AppRoutes.doctorDetails),
                                  child: DoctorListItem(
                                    item: controller.doctors[index],
                                  ));
                            },
                          ),
                  )
                ],
              ));
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 6,
      ),
    );
  }
}
