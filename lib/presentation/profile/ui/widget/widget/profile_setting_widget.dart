import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/empty_view/view/empty_view_screen.dart';
import 'package:maeumgagym_flutter/presentation/profile/ui/widget/widget/profile_quit_dialog.dart';
import 'package:maeumgagym_flutter/presentation/profile/ui/widget/widget/proifle_log_out_dialog.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class ProfileSettingWidget extends StatelessWidget {
  const ProfileSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: MaeumColor.gray25,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => MaeumNavigator.push(context, const EmptyViewScreen()),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaeumText.labelLarge(
                      "내 정보 변경",
                      MaeumColor.black,
                    ),
                    ImageWidget(
                      image: Images.chevronRight,
                      color: MaeumColor.gray200,
                      imageHeight: 24.h,
                      imageWidth: 24.w,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return const ProfileLogOutDialog();
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaeumText.bodyLarge(
                      "로그아웃",
                      MaeumColor.black,
                    ),
                    ImageWidget(
                      image: Images.chevronRight,
                      color: MaeumColor.gray200,
                      imageHeight: 24.h,
                      imageWidth: 24.w,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return const ProfileQuitDialog();
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaeumText.bodyLarge(
                      "회원탈퇴",
                      MaeumColor.black,
                    ),
                    ImageWidget(
                      image: Images.chevronRight,
                      color: MaeumColor.gray200,
                      imageHeight: 24.h,
                      imageWidth: 24.w,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
