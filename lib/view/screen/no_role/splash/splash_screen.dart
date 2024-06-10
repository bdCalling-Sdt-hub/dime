import 'package:dime/helpers/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../../../utils/app_icons.dart';
import '../../../common_widgets/custom_loader.dart';
import '../../../common_widgets/image/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (PrefsHelper.isLogIn) {
          if (PrefsHelper.myRole == 'consultant') {
            Get.offAllNamed(AppRoutes.doctorHome);
          } else {
            Get.offAllNamed(AppRoutes.patientsHome);
          }
        } else {
          Get.offAllNamed(AppRoutes.onboarding);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
                child: CustomImage(
              imageSrc: AppIcons.logo,
              height: 70.h,
            )),
            const Spacer(),
            const CustomLoader(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
