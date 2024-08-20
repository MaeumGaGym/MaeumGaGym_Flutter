import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

import '../../../../component/image_widget.dart';
import '../../../../core/images.dart';

class SelfCareTitle extends StatelessWidget {
  const SelfCareTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageWidget(
                imageWidth: 24.w,
                width: 40.w,
                height: 40.h,
                radiusCircular: 100.r,
                backgroundColor: MaeumColor.blue50,
                image: Images.iconsNotDesignSysDumbelIcon,
              ),
              SizedBox(height: 12.h),
              MaeumText.titleLarge("자기관리", MaeumColor.black),
              SizedBox(height: 12.h),
              MaeumText.bodyMedium("나만의 루틴과 목표를 설정하여\n자기관리에 도전해보세요.", MaeumColor.gray600)
            ],
          ),
        ),
      ],
    );
  }
}
