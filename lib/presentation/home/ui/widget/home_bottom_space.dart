import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/maeum/maeum_color.dart';

class HomeBottomSpace extends StatelessWidget {
  const HomeBottomSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.w),
          child: Center(
            child: Column(
              children: [
                MaeumText.labelSmall(
                  "©2023 마음가짐",
                  MaeumColor.gray400,
                  null,
                  null,
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    launchUrl(Uri.parse(
                        "https://info-dsm.notion.site/2a0474e87f754fbe8f53d58f2003ccb2?pvs=4"));
                  },
                  child: MaeumText.labelLarge(
                    "개인정보 처리방침 보기",
                    MaeumColor.gray400,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 64.h),
      ],
    );
  }
}
