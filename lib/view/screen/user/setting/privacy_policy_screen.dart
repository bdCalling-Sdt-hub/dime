import 'package:dime/controllers/user/setting/privacy_policy_controller.dart';
import 'package:dime/models/api_response_model.dart';
import 'package:dime/view/common_widgets/custom_loader.dart';
import 'package:dime/view/common_widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/text/custom_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            text: "Privacy Policy".tr,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: GetBuilder<PrivacyPolicyController>(
            builder: (controller) => switch (controller.status) {
                  Status.loading => const CustomLoader(),
                  Status.error => ErrorScreen(
                      onTap: PrivacyPolicyController.instance
                          .getPrivacyPolicyRepo()),
                  Status.completed => SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 20),
                      child: Column(
                        children: [
                          Html(data: controller.data.content),
                        ],
                      ),
                    ),
                }));
  }
}
