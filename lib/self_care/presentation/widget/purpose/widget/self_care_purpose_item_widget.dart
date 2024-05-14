import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/widget/self_care_purpose_manage_bottom_sheet.dart';

class SelfCarePurposeItemWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  /// 나중에 수정 필요

  const SelfCarePurposeItemWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MaeumgagymColor.blue50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PtdTextWidget.labelLarge(
                  title,
                  MaeumgagymColor.black,
                ),
                const SizedBox(height: 4),
                PtdTextWidget.bodySmall(
                  subTitle,
                  MaeumgagymColor.gray400,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const SelfCarePurposeManageBottomSheet();
                  },
                );
              },
              child: SvgPicture.asset(
                "assets/image/core_icon/dots_vertical_icon.svg",
                color: MaeumgagymColor.gray400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
