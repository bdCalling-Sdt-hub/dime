import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controllers/consultant/info/added_experience_controller.dart';
import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';


class AddedExperienceAllFiled extends StatelessWidget {
  const AddedExperienceAllFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddedExperienceController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Hospital Name".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
            ),
            CustomTextField(
              controller: controller.hospitalNameController,
              validator: OtherHelper.validator,
              hindText: "Hospital Name".tr,
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.text,
            ),
            CustomText(
              text: "Designation".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            CustomTextField(
              controller: controller.designationController,
              validator: OtherHelper.validator,
              hindText: "Designation".tr,
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.text,
            ),
            CustomText(
              text: "Department".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            CustomTextField(
              controller: controller.departmentController,
              validator: OtherHelper.validator,
              hindText: "Department".tr,
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.text,
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
              keyboardType: TextInputType.text,
            ),
            CustomText(
              text: "Employment Period".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primary,
                    value: controller.isCurrentlyWorking,
                    onChanged: controller.onChange),
                CustomText(
                  text: "Currently working here".tr,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: controller.startDateController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderRadius: 10.r,
                      suffixIcon: GestureDetector(
                          onTap: () => OtherHelper.datePicker(
                              controller.startDateController),
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 32.sp,
                            color: AppColors.black,
                          )),
                      onTap: () {
                        OtherHelper.datePicker(controller.startDateController);
                      },
                      hindText: "Start Date".tr,
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
                    CustomTextField(
                      controller: controller.endDateController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderRadius: 10.r,
                      onTap: () =>
                          OtherHelper.datePicker(controller.endDateController),
                      suffixIcon: GestureDetector(
                        onTap: () => OtherHelper.datePicker(
                            controller.endDateController),
                        child: const Icon(Icons.date_range),
                      ),
                      hindText: "End Date".tr,
                    ),
                  ],
                )),
              ],
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
