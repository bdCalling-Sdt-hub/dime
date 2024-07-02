import 'package:dime/helpers/other_helper.dart';
import 'package:dime/models/api_response_model.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/view/common_widgets/custom_loader.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:dime/view/common_widgets/no_data.dart';
import 'package:dime/view/screen/user/blog/widget/blog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/blog/blogs_controller.dart';
import '../../../../controllers/user/home_controller.dart';
import '../../../../core/app_routes.dart';
import '../../../../models/blogs_model.dart';
import '../../../../models/category_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  BlogsController controller = Get.put(BlogsController());

  @override
  void initState() {
    controller.page = 1;
    controller.getBlogsRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Blog".tr,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
      body: GetBuilder<BlogsController>(
        builder: (controller) {
          return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.sp,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: controller.searchController,
                            hindText: "Search".tr,
                            cursorColor: AppColors.blueNormal,
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                            fillColor: AppColors.transparent,
                            fieldBorderColor: AppColors.black,
                            validator: OtherHelper.validator,
                            onFieldSubmitted: (p0) {
                              controller.page = 1;
                              controller.getBlogsRepo();
                            },
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
                          child: IconButton(
                            onPressed: () => controller.getBlogsRepo(),
                            icon: const Icon(
                              Icons.near_me_outlined,
                            ),
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
                      itemCount:
                          HomeControllerPatients.instance.categories.length + 1,
                      itemBuilder: (context, index) {
                        CategoryModel item = HomeControllerPatients
                            .instance.categories[index == 0 ? 0 : index - 1];

                        String name = index == 0 ? "All" : item.name;
                        String id = index == 0 ? "" : item.id;
                        return GestureDetector(
                            onTap: () {
                              controller.selectCategory(name);
                              controller.blogs.clear();
                              controller.page = 1;
                              controller.categoryId = id;
                              controller.getBlogsRepo();
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.sp,
                                    horizontal: index == 0 ? 16.sp : 8.sp),
                                margin: EdgeInsets.only(left: 8.w),
                                decoration: BoxDecoration(
                                    color: controller.selectedCategory != name
                                        ? AppColors.transparent
                                        : AppColors.secondPrimary,
                                    border: Border.all(
                                        color:
                                            controller.selectedCategory != name
                                                ? AppColors.greyDark
                                                : AppColors.transparent),
                                    borderRadius: BorderRadius.circular(
                                      8.sp,
                                    )),
                                child: CustomText(
                                  text: name,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: controller.selectedCategory != name
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
                      child: switch (controller.status) {
                    Status.loading => const CustomLoader(),
                    Status.error => ErrorScreen(
                        onTap: () => controller.getBlogsRepo(),
                      ),
                    Status.completed => controller.blogs.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: (Get.height * 0.25),
                              ),
                              const NoData(),
                            ],
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.blogs.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Blog item = controller.blogs[index];
                              return BlogItem(
                                onTap: () =>
                                    Get.toNamed(AppRoutes.paymentMethod),
                                price: item.price.toInt(),
                                name: item.title,
                                image: "${AppUrls.imageUrl}${item.image}",
                                description: item.details,
                              );
                            },
                          ),
                  })
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
