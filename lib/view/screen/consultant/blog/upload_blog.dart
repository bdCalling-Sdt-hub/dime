import 'dart:io';

import 'package:dime/controllers/consultant/blog/upload_blog_controller.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:dime/utils/app_colors.dart';
import 'package:dime/view/common_widgets/bottom%20nav%20bar/doctor_nav_bar.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:dime/view/common_widgets/pop%20up/custom_pop_up_menu_button.dart';
import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/text/custom_text.dart';

class UploadBlog extends StatefulWidget {
  const UploadBlog({super.key});

  @override
  State<UploadBlog> createState() => _UploadBlogState();
}

class _UploadBlogState extends State<UploadBlog> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    UploadBlogController.instance.getCategoriesRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Upload Blog".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<UploadBlogController>(
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                          color: AppColors.secondPrimary, width: 0.5)),
                  child: controller.image != null
                      ? Image.file(File(controller.image!))
                      : controller.imageNetwork != null
                          ? CustomImage(imageSrc: controller.imageNetwork!, imageType: ImageType.network,)
                          : GestureDetector(
                              onTap: controller.getImage,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 40.sp,
                                  ),
                                  CustomText(text: "Upload Cover Image".tr)
                                ],
                              ),
                            ),
                ),
                CustomText(
                  text: "Blog Title".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  top: 20.h,
                  bottom: 12.h,
                ),
                CustomTextField(
                  controller: controller.titleController,
                  fillColor: AppColors.transparent,
                  fieldBorderRadius: 5.r,
                  hindText: 'Blog Title'.tr,
                  fieldBorderColor: AppColors.black,
                  validator: OtherHelper.validator,
                ),
                CustomText(
                  text: "Blog Category".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  top: 20.h,
                  bottom: 12.h,
                ),
                CustomTextField(
                  controller: controller.categoryController,
                  fillColor: AppColors.transparent,
                  fieldBorderRadius: 5.r,
                  hindText: "Blog Category".tr,
                  fieldBorderColor: AppColors.black,
                  validator: OtherHelper.validator,
                  keyboardType: TextInputType.none,
                  suffixIcon: PopUpMenu(
                      items: controller.categories,
                      selectedItem: [controller.categoryController.text],
                      onTap: controller.selectCategory),
                ),
                CustomText(
                  text: "Price".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  top: 20.h,
                  bottom: 12.h,
                ),
                CustomTextField(
                  controller: controller.priceController,
                  fillColor: AppColors.transparent,
                  fieldBorderRadius: 5.r,
                  hindText: 'Price'.tr,
                  fieldBorderColor: AppColors.black,
                  validator: OtherHelper.validator,
                ),
                CustomText(
                  text: "Details".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  top: 20.h,
                  bottom: 12.h,
                ),
                CustomTextField(
                  controller: controller.detailsController,
                  fillColor: AppColors.transparent,
                  fieldBorderRadius: 5.r,
                  hindText: 'Details'.tr,
                  fieldBorderColor: AppColors.black,
                  validator: OtherHelper.validator,
                  maxLines: 6,
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomButton(
                  titleText: 'Upload'.tr,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      controller.uploadBlogRepo();
                    }
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomDoctorBottomNavBar(currentIndex: 9),
    );
  }
}
