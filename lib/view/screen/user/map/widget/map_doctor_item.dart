// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:wyndok/utils/app_colors.dart';
// import 'package:wyndok/utils/app_icons.dart';
// import 'package:wyndok/utils/app_images.dart';
// import 'package:wyndok/view/common_widgets/image/custom_image.dart';
// import 'package:wyndok/view/common_widgets/text/custom_text.dart';
//
// class MapDoctorItem extends StatelessWidget {
//   MapDoctorItem({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.title,
//     required this.address,
//   });
//
//   final String image;
//   final String name;
//   final String title;
//   final String address;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 260.w,
//       padding: EdgeInsets.all(10.sp),
//       margin: EdgeInsets.only(right: 20.w),
//       decoration: BoxDecoration(
//           color: Colors.blue, borderRadius: BorderRadius.circular(12.r)),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               CustomImage(
//                 imageSrc: image,
//                 height: 40.sp,
//                 width: 40.sp,
//                 imageType: ImageType.png,
//               ),
//               SizedBox(
//                 width: 8.w,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         CustomText(
//                           text: name,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.white,
//                           fontSize: 16.sp,
//                         ),
//                         const Spacer(),
//                         CircleAvatar(
//                           radius: 16.sp,
//                           backgroundColor: AppColors.white,
//                           child: ClipOval(
//                             child: CustomImage(
//                               imageSrc: AppIcons.send,
//                               height: 24.sp,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     CustomText(
//                       text: title,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12.sp,
//                       color: AppColors.white,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Container(
//             padding: EdgeInsets.all(12.sp),
//             margin: EdgeInsets.only(top: 12.h),
//             decoration: BoxDecoration(
//                 color: AppColors.blueLight,
//                 borderRadius: BorderRadius.circular(8.r)),
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.location_on_outlined,
//                 ),
//                 CustomText(
//                   text: address,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12.sp,
//                   left: 4.w,
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
