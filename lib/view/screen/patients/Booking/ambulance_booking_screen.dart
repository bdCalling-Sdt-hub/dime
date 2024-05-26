import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/patients/Booking/ambulance_booking_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../common_widgets/bottom nav bar/navbar.dart';
import '../../../common_widgets/text_field/custom_text_field.dart';
import 'widget/ambulance_book_list_item.dart';

class AmbulanceBookIngScreen extends StatelessWidget {
  AmbulanceBookIngScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AmbulanceBookingController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hindText: "Search".tr,
                  prefixIcon: const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.greyDarker,
                  ),
                  fillColor: AppColors.blueLight,
                  fieldBorderColor: AppColors.transparent,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const AmbulanceBookListItem(
                        image: AppImages.ambulanceCar,
                        name: "Dr. Maria Waston",
                        address: "Heart Surgeon, London, England",
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 6,
      ),
    );
  }
}
