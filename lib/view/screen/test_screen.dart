import 'package:dime/controllers/user/home_controller.dart';
import 'package:dime/core/app_routes.dart';
import 'package:dime/extension/my_extension.dart';
import 'package:dime/view/common_widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextField(
            controller: HomeControllerPatients.instance.searchController,
          ),
          ElevatedButton(
              onPressed: () =>
                  Get.offNamedUntil(AppRoutes.patientsHome, (route) => true),
              child: 12.width),
        ],
      ),
    );
  }
}
