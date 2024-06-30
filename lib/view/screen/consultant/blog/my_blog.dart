import 'package:dime/controllers/consultant/blog/my_blog_controller.dart';
import 'package:dime/controllers/consultant/blog/upload_blog_controller.dart';
import 'package:dime/models/api_response_model.dart';
import 'package:dime/utils/app_url.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:dime/view/common_widgets/no_data.dart';
import 'package:dime/view/screen/consultant/blog/widget/my_blog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes.dart';
import '../../../../models/my_blogs_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/custom_loader.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class MyBlog extends StatefulWidget {
  const MyBlog({super.key});

  @override
  State<MyBlog> createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlog> {
  @override
  void initState() {
    MyBlogController.instance.getBlogsRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "My Blog".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<MyBlogController>(
        builder: (controller) => SingleChildScrollView(
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
                    child: switch (controller.status) {
                  Status.loading =>
                    SizedBox(height: 200.h, child: const CustomLoader()),
                  Status.error => ErrorScreen(
                      onTap: () => controller.getBlogsRepo(),
                    ),
                  Status.completed => controller.blogs.isEmpty
                      ? SizedBox(height: 400.h, child: const NoData())
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.blogs.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Blog item = controller.blogs[index];
                            return MyBlogItem(
                              onTap: () {
                                UploadBlogController
                                    .instance.titleController.text = item.title;
                                UploadBlogController.instance.detailsController
                                    .text = item.details;
                                UploadBlogController.instance.priceController
                                    .text = item.price.toString();

                                UploadBlogController.instance.imageNetwork =
                                    "${AppUrls.imageUrl}${item.image}";

                                Get.toNamed(AppRoutes.uploadBlog);
                              },
                              price: item.price,
                              name: item.title,
                              image: item.image,
                              description: item.details,
                            );
                          },
                        ),
                })
              ],
            )),
      ),
      bottomNavigationBar: const CustomDoctorBottomNavBar(currentIndex: 9),
    );
  }
}
