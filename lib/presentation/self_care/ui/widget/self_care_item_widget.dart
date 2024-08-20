import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

import '../../../../component/image_widget.dart';
import '../../../../core/images.dart';

class SelfCareItemWidget extends StatelessWidget {
  final String imagePath, title;
  final double width, height;
  final Widget routePage;

  const SelfCareItemWidget({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.title,
    required this.routePage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => MaeumNavigator.push(context, routePage),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  alignment: Alignment.center,
                  // 이것도 align 지정안하면 크기 변경 안돼요
                  decoration: BoxDecoration(
                    color: MaeumColor.gray200,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ImageWidget(
                    imageWidth: width,
                    imageHeight: height,
                    image: imagePath,
                  ),
                ),
                SizedBox(width: 16.w),
                MaeumText.bodyLarge(
                  title,
                  MaeumColor.black,
                ),
              ],
            ),
            ImageWidget(
              width: 24.w,
              image: Images.chevronRight,
              color: MaeumColor.gray200,
            ),
          ],
        ),
      ),
    );
  }
}
