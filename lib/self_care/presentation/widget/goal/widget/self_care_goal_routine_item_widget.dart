import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/goal/widget/self_care_goal_shared_widget.dart';

class SelfCareGoalRoutineItemWidget extends StatelessWidget {
  final String title;

  const SelfCareGoalRoutineItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

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
                SizedBox(height: 4),
                PtdTextWidget.bodySmall(
                  "사용중",
                  MaeumgagymColor.blue500,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MaeumgagymColor.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: SelfCareGoalSharedWidget(),
                ),
                const SizedBox(width: 12),
                SvgPicture.asset(
                  "assets/image/core_icon/dots_vertical_icon.svg",
                  color: MaeumgagymColor.gray400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
