import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../controllers/user/profile_controller.dart';
import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/pop up/custom_pop_up_menu_button.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';

class EditProfileAllFiled extends StatelessWidget {
  const EditProfileAllFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Full Name".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
            ),
            CustomTextField(
              controller: controller.nameController,
              validator: OtherHelper.validator,
              hindText: "Full Name".tr,
              prefixIcon: const Icon(Icons.person),
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.text,
              fieldBorderColor: AppColors.black,
              fillColor: AppColors.transparent,
            ),
            CustomText(
              text: "Contact".tr,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              top: 20.h,
              bottom: 12.h,
            ),
            IntlPhoneField(
              controller: controller.numberController,
              onChanged: (value) {
                if (kDebugMode) {
                  print(value);
                }
              },
              decoration: InputDecoration(
                hintText: "Phone Number".tr,
                fillColor: AppColors.transparent,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.w, vertical: 14.h),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              initialCountryCode: "BD",
              disableLengthCheck: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Date of birth".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      controller: controller.dateOfBirthController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderColor: AppColors.black,
                      fillColor: AppColors.transparent,
                      fieldBorderRadius: 10.r,
                      onTap: () => OtherHelper.datePicker(
                          controller.dateOfBirthController),
                      hindText: "Date of birth".tr,
                    ),
                  ],
                )),
                SizedBox(
                  width: 20.sp,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Age".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      controller: controller.ageController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.number,
                      fieldBorderRadius: 10.r,
                      hindText: "Age".tr,
                      fieldBorderColor: AppColors.black,
                      fillColor: AppColors.transparent,
                    ),
                  ],
                )),
              ],
            ),
            CustomText(
              text: "About Me".tr,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              bottom: 12.h,
            ),
            CustomTextField(
              controller: controller.descriptionController,
              validator: OtherHelper.validator,
              keyboardType: TextInputType.number,
              fieldBorderRadius: 10.r,
              maxLines: null,
              fieldBorderColor: AppColors.black,
              fillColor: AppColors.transparent,
              hindText: "About Me".tr,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Gender".tr,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
                SizedBox(
                  width: 150.w,
                  child: CustomTextField(
                    controller: controller.genderController,
                    fillColor: AppColors.black,
                    textAlign: TextAlign.center,
                    hindText: 'Gender'.tr,
                    textStyle: const TextStyle(color: AppColors.white),
                    suffixIcon: PopUpMenu(
                        items: controller.gender,
                        iconColor: AppColors.white,
                        selectedItem: [controller.genderController.text],
                        onTap: controller.selectedGender),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
