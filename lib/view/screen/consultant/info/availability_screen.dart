import 'package:dime/extension/my_extension.dart';
import 'package:dime/helpers/other_helper.dart';
import 'package:dime/utils/app_colors.dart';
import 'package:dime/utils/app_utils.dart';
import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/consultant/info/availability_controller.dart';
import '../../../common_widgets/bottom nav bar/doctor_nav_bar.dart';
import '../../../common_widgets/button/custom_button.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/registation_step.dart';
import 'widget/week_item.dart';

class AvailabilityScreen extends StatelessWidget {
  AvailabilityScreen({super.key});

  final String type = Get.parameters["type"] ?? "";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(AvailabilityController.instance.selectedWeekList);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Availability".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<AvailabilityController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  type == "back"
                      ? const SizedBox()
                      : const Center(child: RegistrationStep(indexNumber: 2)),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    controller: controller.videoConferenceFeeController,
                    validator: OtherHelper.validator,
                    labelText: "Enter your Video Conference fee".tr,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    controller: controller.videoReplyFeeController,
                    validator: OtherHelper.validator,
                    labelText: "Enter your Video Reply fee".tr,
                    keyboardType: TextInputType.number,
                  ),
                  CustomText(
                    text: "Please select the days".tr,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    bottom: 18.h,
                    top: 20.h,
                  ),
                  SizedBox(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.week.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 50.h,
                          crossAxisSpacing: 18.sp,
                          mainAxisSpacing: 18.sp),
                      itemBuilder: (context, index) {
                        var item = controller.week[index];
                        return GestureDetector(
                          onTap: () => controller.selectWeek(index),
                          child: WeekItem(
                            item: item,
                            fineItem: controller.findItem(item),
                            isSelected: controller.findItem(item).isNotEmpty
                                ? true
                                : false,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                    titleText: type == "back" ? "Save Changes".tr : "Next".tr,
                    isLoading: controller.isLoading,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (controller.selectedWeekList.isNotEmpty) {
                          controller.updateProfileRepo(type);
                        } else {
                          Utils.snackBarMessage("Select Days".tr,
                              "Please, select Available days".tr);
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: type == "back"
          ? const CustomDoctorBottomNavBar(currentIndex: 3)
          : const SizedBox(),
    );
  }
}
