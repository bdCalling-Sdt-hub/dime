import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../common_widgets/text/custom_text.dart';

class RegistrationStep extends StatelessWidget {
  const RegistrationStep({super.key, required this.indexNumber});

  final int indexNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: "Step $indexNumber of 3",
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
          SizedBox(
            height: 6.h,
          ),
          Expanded(
            child: SizedBox(
              width: Get.width * 0.25,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 4.h,
                    width: 30.w,
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                        color: index == indexNumber - 1
                            ? AppColors.secondPrimary
                            : AppColors.greyLightActive,
                        borderRadius: BorderRadius.circular(30.r)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
