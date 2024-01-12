import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMyRoutineManageItemWidget extends StatelessWidget {
  final String title;
  final String iconPath;

  const SelfCareMyRoutineManageItemWidget({
    Key? key,
    required this.title,
    required this.iconPath,
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
              iconPath,
              width: 28,
              height: 28,
            ),
            const SizedBox(width: 24),
            PtdTextWidget.labelLarge(
              title,
              MaeumgagymColor.black,
            ),
          ],
        ),
      ),
    );
  }
}
