import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';

class OnBoardingContentsWidget extends StatelessWidget {
  final String image, title;

  const OnBoardingContentsWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw - 32.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: MaeumColor.gray50,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageWidget(
              image: image,
              width: 24.w,
              height: 24.h,
            ),
            MaeumText.labelMedium(title, Colors.black),
            SizedBox(width: 24.w),
          ],
        ),
      ),
    );
  }
}
