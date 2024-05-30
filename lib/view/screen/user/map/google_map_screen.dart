// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:wyndok/utils/app_images.dart';
// import 'package:wyndok/view/common_widgets/google%20map/google_map.dart';
//
// import '../../../../controllers/patients/google_map_controller.dart';
// import '../../../common_widgets/bottom nav bar/navbar.dart';
// import '../../../common_widgets/text/custom_text.dart';
// import 'widget/map_doctor_item.dart';
//
// class GoogleMapScreen extends StatefulWidget {
//   GoogleMapScreen({super.key});
//
//   @override
//   State<GoogleMapScreen> createState() => _GoogleMapScreenState();
// }
//
// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   ShowGoogleMapController showGoogleMapController =
//       Get.put(ShowGoogleMapController());
//
//   @override
//   void dispose() {
//     showGoogleMapController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: CustomText(
//           text: "Doctor Find".tr,
//           fontWeight: FontWeight.w600,
//           fontSize: 24.sp,
//         ),
//       ),
//       body: GetBuilder<GoogleMapController>(
//         builder: (controller) {
//           return Stack(
//             alignment: AlignmentDirectional.bottomEnd,
//             children: [
//               ShowGoogleMap(onTapLatLong: controller.latLongToAddress),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       text: "Choose your nearby doctor".tr,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 20.sp,
//                       bottom: 16.h,
//                     ),
//                     SizedBox(
//                       height: 150.h,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 10,
//                         itemBuilder: (context, index) {
//                           return MapDoctorItem(
//                             image: AppImages.doctorSarah,
//                             name: "Dr. Alan Hathaway",
//                             title: "Cardiovascular",
//                             address: "Block B, House 23, Banshee",
//                           );
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//       bottomNavigationBar: const CustomBottomNavBar(
//         currentIndex: 2,
//       ),
//     );
//   }
// }
