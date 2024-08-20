import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/image_widget.dart';
import '../../../../core/maeum/maeum_color.dart';
import '../../../../core/maeum/maeum_text.dart';

class RoutineManagerItemWidget extends StatelessWidget {
  final String title, image;
  final GestureTapCallback onTap;

  const RoutineManagerItemWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          children: [
            ImageWidget(image: image, width: 28.w),
            SizedBox(width: 24.w),
            MaeumText.labelLarge(title, MaeumColor.black),
          ],
        ),
      ),
    );
  }
}
