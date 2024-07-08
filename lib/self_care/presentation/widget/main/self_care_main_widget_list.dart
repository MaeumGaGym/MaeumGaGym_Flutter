import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/empty_view/view/empty_view_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_main_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/purpose/self_care_purpose_main_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/self_care_item_widget.dart';

class SelfCareMainWidgetList extends StatelessWidget {
  const SelfCareMainWidgetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PtdTextWidget.titleMedium(
              "자기관리",
              MaeumgagymColor.black,
            ),
          ),
          const SizedBox(height: 12),
          const SelfCareItemWidget(
            width: 25,
            height: 28,
            imagePath: Images.iconsNotDesignSysRoutineIcon,
            title: "내 루틴",
            routePage: SelfCareMyRoutineMainScreen(),
          ),
          const SelfCareItemWidget(
            width: 25,
            height: 28,
            imagePath: Images.iconsNotDesignSysTargetIcon,
            title: "목표",
            routePage: SelfCarePurposeMainScreen(),
          ),
          const SelfCareItemWidget(
            width: 25,
            height: 28,
            imagePath: Images.iconsNotDesignSysDietIcon,
            title: "식단",
            routePage: EmptyViewScreen(),
          ),
          const SelfCareItemWidget(
            width: 25,
            height: 28,
            imagePath: Images.iconsNotDesignSysTodayExcersizeCompleteIcon,
            title: "오운완",
            routePage: EmptyViewScreen(),
          ),
        ],
      ),
    );
  }
}
