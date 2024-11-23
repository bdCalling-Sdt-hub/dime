import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/image/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.rating,
  });

  final String image;
  final String name;
  final String message;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28.sp,
                child: ClipOval(
                  child: CustomImage(
                    imageSrc: image,
                    imageType: ImageType.network,
                    height: 56.sp,
                    width: 56.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  Row(
                    children: [
                      CustomText(text: rating),
                      SizedBox(
                          height: 30.w,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                                size: 20.sp,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                                size: 20.sp,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                                size: 20.sp,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                                size: 20.sp,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                                size: 20.sp,
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ))
            ],
          ),
          CustomText(
            text: message,
            maxLines: 3,
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
