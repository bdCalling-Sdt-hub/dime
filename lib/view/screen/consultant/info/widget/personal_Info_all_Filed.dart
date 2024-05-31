import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../controllers/consultant/info/Personal_information_controller.dart';
import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/pop up/custom_pop_up_menu_button.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';

class PersonalInfoAllFiled extends StatelessWidget {
  const PersonalInfoAllFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalInformationController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Title".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
            ),
            CustomTextField(
              controller: controller.titleController,
              validator: OtherHelper.validator,
              hindText: "Title".tr,
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.none,
              fillColor: AppColors.transparent,
              fieldBorderColor: AppColors.secondPrimary,
              suffixIcon: PopUpMenu(
                items: controller.titleList,
                selectedItem: controller.titleController.text,
                onTap: controller.selectedTitle,
              ),
            ),
            CustomText(
              text: "Full Name".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            CustomTextField(
              controller: controller.nameController,
              validator: OtherHelper.validator,
              hindText: "Full Name".tr,
              prefixIcon: const Icon(Icons.person),
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.name,
              fillColor: AppColors.transparent,
              fieldBorderColor: AppColors.secondPrimary,
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
                print(value);
              },
              decoration: InputDecoration(
                hintText: "Phone Number".tr,
                fillColor: AppColors.transparent,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.w, vertical: 14.h),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.secondPrimary),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.secondPrimary),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              initialCountryCode: "BD",
              disableLengthCheck: false,
            ),
            CustomText(
              text: "Date of birth".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
            ),
            CustomTextField(
              controller: controller.dateOfBrithController,
              validator: OtherHelper.validator,
              hindText: "Date of birth".tr,
              fillColor: AppColors.transparent,
              fieldBorderColor: AppColors.secondPrimary,
              suffixIcon: GestureDetector(
                  onTap: () =>
                      OtherHelper.datePicker(controller.dateOfBrithController),
                  child: const Icon(Icons.date_range)),
              onTap: () =>
                  OtherHelper.datePicker(controller.dateOfBrithController),
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.none,
            ),
            CustomText(
              text: "Country".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            CustomTextField(
              controller: controller.countryController,
              validator: OtherHelper.validator,
              hindText: "Country".tr,
              fieldBorderRadius: 10.r,
              fillColor: AppColors.transparent,
              fieldBorderColor: AppColors.secondPrimary,
              keyboardType: TextInputType.text,
            ),


            CustomText(
              text: "NID/Passport Number".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            CustomTextField(
              controller: controller.identifierNumberController,
              validator: OtherHelper.validator,
              hindText: "NID/Passport Number".tr,
              fieldBorderRadius: 10.r,
              fillColor: AppColors.transparent,
              fieldBorderColor: AppColors.secondPrimary,
              keyboardType: TextInputType.text,
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
                      text: "Gender".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      controller: controller.genderController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderRadius: 10.r,
                      fillColor: AppColors.transparent,
                      fieldBorderColor: AppColors.secondPrimary,
                      suffixIcon: PopUpMenu(
                        items: controller.gender,
                        selectedItem: controller.genderController.text,
                        onTap: controller.selectedGender,
                      ),
                      hindText: "Gender".tr,
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
                      text: "Consultant Type".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      controller: controller.consultantTypeController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderRadius: 10.r,
                      fillColor: AppColors.transparent,
                      fieldBorderColor: AppColors.secondPrimary,
                      suffixIcon: PopUpMenu(
                        items: controller.doctorType,
                        selectedItem: controller.consultantTypeController.text,
                        onTap: controller.selectedDoctorType,
                      ),
                      hindText: "Medical".tr,
                    ),
                  ],
                )),
              ],
            ),
            CustomText(
              text: "About Me".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.sp,
            ),
            CustomTextField(
              controller: controller.aboutMeController,
              validator: OtherHelper.validator,
              hindText: "Text here".tr,
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.text,
              fillColor: AppColors.transparent,
              fieldBorderColor: AppColors.secondPrimary,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        );
      },
    );
  }
}
