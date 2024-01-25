import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/goal/widget/self_care_goal_manage_bottom_sheet.dart';

class SelfCareDefaultAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final String iconPath;
  final String? actionIconPath;

  final Color? backgroundColor;
  final Color? color;

  const SelfCareDefaultAppBar({
    Key? key,
    this.title,
    this.backgroundColor,
    this.color,
    this.actionIconPath,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: backgroundColor ?? MaeumgagymColor.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        iconPath,
                        width: 28,
                        height: 28,
                        color: color ?? MaeumgagymColor.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  PtdTextWidget.labelLarge(
                    title ?? "",

                    /// title이 null이라면 공백처리
                    color ?? MaeumgagymColor.black,
                  ),
                ],
              ),
              if (actionIconPath != null)
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const SelfCareGoalManageBottomSheet();
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    actionIconPath!,
                    width: 28,
                    height: 28,
                    color:  color ?? MaeumgagymColor.black,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
