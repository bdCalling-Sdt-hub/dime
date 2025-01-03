import 'package:dime/controllers/consultant/transaction/transaction_controller.dart';
import 'package:dime/core/app_routes.dart';
import 'package:dime/models/api_response_model.dart';
import 'package:dime/utils/app_colors.dart';
import 'package:dime/utils/app_images.dart';
import 'package:dime/view/common_widgets/button/custom_button.dart';
import 'package:dime/view/common_widgets/custom_loader.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/text/custom_text.dart';
import 'widget/table.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    TransactionController.instance.getRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Transactions".tr,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<TransactionController>(
        builder: (controller) => controller.isLoading
            ? const CustomLoader()
            : switch (controller.status) {
                Status.loading => const CustomLoader(),
                Status.error => ErrorScreen(onTap: controller.getRepo),
                Status.completed => SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 190.sp,
                            width: 370.sp,
                            padding: EdgeInsets.all(16.sp),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.card))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Your Balance'.tr,
                                  color: AppColors.white,
                                  top: 12.sp,
                                ),
                                CustomText(
                                  text: "\$${controller.amount}",
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40.sp,
                                ),
                                const Spacer(),
                                CustomButton(
                                  titleText: 'Withdraw'.tr,
                                  buttonRadius: 10.r,
                                  borderColor: AppColors.transparent,
                                  buttonHeight: 50.sp,
                                  onTap: () => Get.toNamed(AppRoutes.withdraw),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          children: [
                            const Expanded(child: Divider()),
                            CustomText(
                              text: "Recent Transactions".tr,
                              left: 12.sp,
                              right: 12.sp,
                            ),
                            const Expanded(child: Divider())
                          ],
                        ),
                        CustomTable(
                          list: controller.recentTransactionModel.data
                              .attributes.withdrawRequests,
                        )
                      ],
                    ),
                  ),
              },
      ),
    );
  }
}
