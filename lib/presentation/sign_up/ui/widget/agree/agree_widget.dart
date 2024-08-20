import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/maeum/maeum_text.dart';
import '../../../../../core/maeum/maeum_color.dart';
import 'check_box_widget.dart';

class AgreeWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  final bool state, isDetail, isOption;

  const AgreeWidget({
    super.key,
    required this.onTap,
    required this.state,
    required this.title,
    this.isDetail = false,
    this.isOption = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                /// CheckBoxWidget ( allCheck )
                CheckBoxWidget(state: state),
                SizedBox(width: 12.w),

                /// 모두 동의해요. 글자
                MaeumText.bodyMedium(
                  title,
                  MaeumColor.black,
                ),
                isOption ? MaeumText.bodyMedium(' (선택)', MaeumColor.gray400) : const SizedBox.shrink(),
              ],
            ),
          ),
        ),

        /// 자세히 보기 ( agreePersonInformation )
        isDetail ? GestureDetector(
          onTap: () {
            launchUrl(
              Uri.parse(
                "https://info-dsm.notion.site/2a0474e87f754fbe8f53d58f2003ccb2?pvs=4",
              ),
            );
          },
          child: MaeumText.labelSmall(
            '자세히 보기',
            MaeumColor.gray300,
            TextDecoration.underline,
            MaeumColor.gray300,
          ),
        ) : const SizedBox.shrink(),
      ],
    );
  }
}
