import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/image_widget.dart';
import '../../../core/images.dart';
import '../../../core/maeum/maeum_text.dart';
import '../../../core/maeum/maeum_color.dart';
import '../widget/empty_view_app_bar.dart';

class EmptyViewScreen extends StatelessWidget {
  final bool useAppBar;

  const EmptyViewScreen({
    super.key,
    this.useAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumColor.white,
      appBar: useAppBar ? const EmptyViewAppBar() : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(
              image: Images.iconsNotDesignSysEmptyViewIcon,
              width: 120.w,
              height: 120.h,
            ),
            SizedBox(height: 24.h),
            MaeumText.titleMedium('아직 개발중이에요', MaeumColor.black),
            SizedBox(height: 12.h),
            MaeumText.bodyMedium('현재 탭은 개발중입니다.', MaeumColor.gray500),
            MaeumText.bodyMedium('빠른 시일 내에 더욱 나은 모습으로 찾아뵙겠습니다.', MaeumColor.gray500),
          ],
        ),
      ),
    );
  }
}
