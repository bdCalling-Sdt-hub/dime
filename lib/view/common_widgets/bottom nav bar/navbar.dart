import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../image/custom_image.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavBar({required this.currentIndex, super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  var bottomNavIndex = 0;
  List<Widget> unselectedIcons = [
    const Icon(Icons.home_outlined, color: AppColors.black),
    const Icon(Icons.notifications_outlined, color: AppColors.black),
    const CustomImage(
      imageSrc: AppIcons.chat,
      imageColor: AppColors.black,
    ),
    const Icon(Icons.person_2_outlined, color: AppColors.black),
  ];

  List<Widget> selectedIcons = [
    const Icon(Icons.home, color: AppColors.secondPrimary),
    const Icon(Icons.notifications, color: AppColors.secondPrimary),
    const CustomImage(
      imageSrc: AppIcons.chat,
      imageColor: AppColors.secondPrimary,
    ),
    const Icon(Icons.person, color: AppColors.secondPrimary),
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
            color: AppColors.blueLight,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(unselectedIcons.length, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsetsDirectional.all(12.sp),
                child: Column(
                  children: [
                    index == bottomNavIndex
                        ? selectedIcons[index]
                        : unselectedIcons[index],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void onTap(int index) async {
    print(widget.currentIndex);
    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
        Get.toNamed(AppRoutes.patientsHome);
      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        Get.toNamed(AppRoutes.notifications);
      }
    } else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.toNamed(AppRoutes.chat);
      }
    } else if (index == 3) {
      if (!(widget.currentIndex == 3)) {
        Get.toNamed(AppRoutes.patientsProfile);
      }
    }
  }
}
