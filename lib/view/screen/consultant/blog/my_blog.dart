import 'package:dime/controllers/consultant/blog/my_blog_controller.dart';
import 'package:dime/controllers/consultant/blog/upload_blog_controller.dart';
import 'package:dime/view/screen/consultant/blog/widget/my_blog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/custom_loader.dart';
import '../../../common_widgets/text/custom_text.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';

class MyBlog extends StatelessWidget {
  MyBlog({super.key});

  UploadBlogController uploadBlogController = Get.put(UploadBlogController());

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
                  child: controller.isLoading
                      ? SizedBox(height: 200.h, child: const CustomLoader())
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MyBlogItem(
                              onTap: () {
                                uploadBlogController.titleController.text =
                                    "Big Data";
                                uploadBlogController.detailsController.text =
                                    "Why Big Data Needs Thick Data";
                                uploadBlogController.priceController.text =
                                    '50';
                                Get.toNamed(AppRoutes.uploadBlog);
                              },
                              price: 50,
                              name: 'Big Data',
                              image: AppImages.blog,
                              description: 'Why Big Data Needs Thick Data',
                            );
                          },
                        ),
                )
              ],
            )),
      ),
    );
  }
}
