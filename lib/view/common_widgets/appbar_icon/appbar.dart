import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../text/custom_text.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: CustomText(
          text: title,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ));
  }
}
