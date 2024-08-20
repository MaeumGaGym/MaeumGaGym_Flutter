import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class PurposeEmptyWidget extends StatelessWidget {
  const PurposeEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 180.h),
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: MaeumColor.gray50,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: ImageWidget(
              image: Images.iconsNotDesignSysTargetIcon,
              imageWidth: 96.w,
            ),
          ),
          SizedBox(height: 24.h),
          MaeumText.titleMedium("아직 목표가 없어요", MaeumColor.gray600),
          SizedBox(height: 12.h),
          MaeumText.bodyMedium("목표를 추가하고 목표를 향해 달려보세요.", MaeumColor.gray500),
        ],
      ),
    );
  }
}
