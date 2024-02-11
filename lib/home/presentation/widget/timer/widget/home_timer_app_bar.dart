import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/goal/widget/self_care_goal_manage_bottom_sheet.dart';

class HomeTimerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeTimerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: MaeumgagymColor.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
