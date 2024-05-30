import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/text/custom_text.dart';
import 'widget/favorite_list_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Favorite".tr,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemBuilder: (context, index) {
          return FavoriteListItem(
            image: AppImages.katryn,
            name: "Katryn Murphy",
            title: "Cardiologist",
            rating: "4.8",
          );
        },
      ),
    );
  }
}
