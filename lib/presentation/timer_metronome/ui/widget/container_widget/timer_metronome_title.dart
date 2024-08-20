import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';

class TimerMetronomeTitle extends StatelessWidget {
  final bool isTimer;

  const TimerMetronomeTitle({
    super.key,
    required this.isTimer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaeumText.titleMedium(
            isTimer ? "타이머" : "메트로놈",
            MaeumColor.black,
          ),

          ImageWidget(
            image: Images.chevronRight,
            width: 24.w,
            height: 24.h,
            color: MaeumColor.gray200,
          ),
        ],
      ),
    );
  }
}
