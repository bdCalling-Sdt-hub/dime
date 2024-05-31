import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/consultant/info/professional_qualifications_controller.dart';
import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/pop up/custom_pop_up_menu_button.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';

class ProfessionalQualificationsAllFiled extends StatelessWidget {
  const ProfessionalQualificationsAllFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfessionalQualificationsController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Select your area of expertise(max 2)".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
            ),
            CustomTextField(
              controller: controller.expertiseController,
              validator: (value) {
                if (controller.expertiseList.isEmpty) {
                  return "This field is required";
                } else {
                  return null;
                }
              },
              hindText: "Select your area of expertise(max 2)".tr,
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.none,
              suffixIcon: PopUpMenu(
                items: controller.expertises,
                selectedItem: controller.expertiseController.text,
                onTap: controller.selectedExpertises,
              ),
            ),
            controller.expertiseList.isNotEmpty
                ? Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8,
                    children: controller.expertiseList.map((item) {
                      return Container(
                        margin: EdgeInsets.only(top: 8.h),
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          CustomText(
                              fontSize: 14,
                              maxLines: 3,
                              color: AppColors.blueNormal,
                              right: 8,
                              text: item),
                          GestureDetector(
                              onTap: () => controller.removeExpertise(item),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.blueNormal,
                              )),
                        ]),
                      );

                      //========================Remove Tag====================
                    }).toList(),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 16,
            ),
            CustomText(
              text: "Category".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            CustomTextField(
              controller: controller.categoryController,
              validator: OtherHelper.validator,
              hindText: "Category".tr,
              suffixIcon: PopUpMenu(
                  items: controller.category,
                  selectedItem: controller.categoryController.text,
                  onTap: controller.selectedCategory),
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.none,
            ),
            CustomText(
              text: "Degree Name".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            CustomTextField(
              controller: controller.degreeController,
              validator: OtherHelper.validator,
              hindText: "Degree Name".tr,
              suffixIcon: PopUpMenu(
                  items: controller.degrees,
                  selectedItem: controller.degreeController.text,
                  onTap: controller.selectedDegree),
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.none,
            ),
            CustomText(
              text: "Institute Name".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            CustomTextField(
              controller: controller.instituteController,
              validator: OtherHelper.validator,
              hindText: "Institute Name".tr,
              fieldBorderRadius: 10.r,
              keyboardType: TextInputType.text,
            ),
            CustomText(
              text: "Select Country".tr,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              bottom: 12.h,
              top: 20.h,
            ),
            CustomTextField(
              controller: controller.countryController,
              validator: OtherHelper.validator,
              hindText: "Select Country".tr,
              fieldBorderRadius: 10.r,
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
                      text: "Passing Year".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      controller: controller.passingYearController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderRadius: 10.r,
                      suffixIcon: GestureDetector(
                          onTap: () => controller.yearPicker(),
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 32.sp,
                            color: AppColors.black,
                          )),
                      onTap: () {
                        controller.yearPicker();
                      },
                      hindText: "Passing Year".tr,
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
                      text: "Duration".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      bottom: 12.h,
                    ),
                    CustomTextField(
                      controller: controller.durationController,
                      validator: OtherHelper.validator,
                      keyboardType: TextInputType.none,
                      fieldBorderRadius: 10.r,
                      suffixIcon: PopUpMenu(
                        items: controller.years,
                        selectedItem: controller.durationController.text,
                        onTap: controller.selectedYear,
                      ),
                      hindText: "Duration".tr,
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
