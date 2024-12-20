import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/user/profile_controller.dart';
import '../../../../helpers/prefs_helper.dart';
import '../../../../utils/app_url.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/image/custom_image.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/edit_profile_all_filed.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
              text: "Book Appointment".tr,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 85.sp,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: controller.image != null
                                ? Image.file(
                                    File(controller.image!),
                                    width: 170.sp,
                                    height: 170.sp,
                                    fit: BoxFit.fill,
                                  )
                                : CustomImage(
                                    imageSrc:
                                        "${AppUrls.imageUrl}/${PrefsHelper.myImage}",
                                    imageType: ImageType.network,
                                    height: 170.sp,
                                    width: 170.sp,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: Get.width * 0.53,
                          child: IconButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateColor.resolveWith(
                                (states) => Colors.black,
                              )),
                              onPressed: controller.getProfileImage,
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              )))
                    ],
                  ),
                  const EditProfileAllFiled(),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                      titleText: "Save Changes".tr,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.updateProfileRepo();
                        }
                      }),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(
            currentIndex: 6,
          ),
        );
      },
    );
  }
}
