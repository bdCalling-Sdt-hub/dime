import 'package:dime/core/app_routes.dart';
import 'package:dime/utils/app_colors.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/view/common_widgets/image/custom_image.dart';
import 'package:dime/view/common_widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: DataTable(
          columnSpacing: 30.sp,
          showCheckboxColumn: false,
          headingRowColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              return AppColors.secondPrimary; // Default color
            },
          ),
          columns: <DataColumn>[
            DataColumn(
              label: CustomText(
                text: '#SI',
                fontSize: 10.sp,
                color: Colors.white,
              ),
            ),
            DataColumn(
              label: CustomText(
                text: 'Full Name',
                fontSize: 10.sp,
                color: Colors.white,
              ),
            ),
            DataColumn(
              label: CustomText(
                text: 'Acc Number',
                fontSize: 10.sp,
                color: Colors.white,
              ),
            ),
            DataColumn(
              label: CustomText(
                text: 'Date',
                fontSize: 10.sp,
                color: Colors.white,
              ),
            ),
            DataColumn(
              label: CustomText(
                text: 'Amount',
                fontSize: 10.sp,
                color: Colors.white,
              ),
            ),
          ],
          rows: List.generate(
            10,
            (index) => DataRow(
              onSelectChanged: (value) =>
                  Get.toNamed(AppRoutes.transactionDetails),
              cells: <DataCell>[
                DataCell(
                    CustomText(text: (index + 1).toString(), fontSize: 10.sp)),
                DataCell(Row(
                  children: [
                    const CustomImage(
                      imageSrc: AppImages.profile,
                      imageType: ImageType.png,
                    ),
                    Expanded(
                        child: CustomText(
                      text: 'John Doe',
                      fontSize: 10.sp,
                      left: 4.sp,
                      maxLines: 2,
                    )),
                  ],
                )),
                DataCell(CustomText(text: '1234567890', fontSize: 10.sp)),
                DataCell(CustomText(text: '2023-01-01', fontSize: 10.sp)),
                DataCell(CustomText(text: '\$1000', fontSize: 10.sp)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
