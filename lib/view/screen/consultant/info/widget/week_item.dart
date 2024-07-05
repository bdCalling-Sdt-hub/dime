import 'package:dime/controllers/consultant/info/availability_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../helpers/other_helper.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../common_widgets/text_field/custom_text_field.dart';

class WeekItem extends StatelessWidget {
  WeekItem({
    super.key,
    required this.item,
    required this.fineItem,
    required this.isSelected,
  });

  final Map item;
  final Map fineItem;
  final bool isSelected;

  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    startController.text = fineItem['startTime'] ?? item['startTime'];
    endController.text = fineItem['endTime'] ?? item['endTime'];
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60.h,
            decoration: BoxDecoration(
                color: isSelected ? AppColors.black : AppColors.transparent,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.secondPrimary, width: 1)),
            child: Center(
              child: CustomText(
                text: item['day'],
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: isSelected ? AppColors.white : AppColors.blueLightActive,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
            flex: 2,
            child: CustomTextField(
              controller: startController,
              fieldBorderColor: AppColors.secondPrimary,
              fillColor: AppColors.transparent,
              hindText: 'Start'.tr,
              vertical: 0.w,
              validator: OtherHelper.validator,
              fieldBorderRadius: 6.r,
              keyboardType: TextInputType.none,
              suffixIcon: const Icon(
                Icons.access_time,
                size: 16,
              ),
              onTap: () async {
                var startTime =
                    await OtherHelper.openTimePicker(startController);
                AvailabilityController.instance.updateWeek(item, {
                  'day': item['day'],
                  'startTime': startTime,
                  'endTime': item['endTime'],
                });
              },
            )),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
            flex: 2,
            child: CustomTextField(
              controller: endController,
              fieldBorderColor: AppColors.secondPrimary,
              fillColor: AppColors.transparent,
              keyboardType: TextInputType.none,
              hindText: 'End'.tr,
              vertical: 0.w,
              onTap: () async {
                var endTime = await OtherHelper.openTimePicker(endController);
                AvailabilityController.instance.updateWeek(item, {
                  'day': item['day'],
                  'startTime': item['startTime'],
                  'endTime': endTime,
                });
              },
              validator: OtherHelper.validator,
              fieldBorderRadius: 6.r,
              suffixIcon: const Icon(Icons.access_time),
            )),
      ],
    );
  }
}
