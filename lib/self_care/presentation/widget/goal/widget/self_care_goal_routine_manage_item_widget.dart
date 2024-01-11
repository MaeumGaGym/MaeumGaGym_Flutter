import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareGoalRoutineManageItemWidget extends StatelessWidget {
  final String title;

  const SelfCareGoalRoutineManageItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/image/self_care_icon/edit_pencil_icon.svg",
              width: 28,
              height: 28,
            ),
            const SizedBox(width: 24),
            PtdTextWidget.labelLarge(
              "수정",
              MaeumgagymColor.black,
            ),
          ],
        ),
      ),
    );
  }
}
