import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/widget/home_main_content_widget.dart';

class HomeMainContentListContainer extends StatelessWidget {
  const HomeMainContentListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        HomeMainContentWidget(
          iconPath: "assets/image/home_icon/calculate_icon.svg",
          title: "칼로리 계산기",
          content: "먹은 음식의 칼로리를\n계산해 보세요.",
        ),
        SizedBox(width: 12),
        HomeMainContentWidget(
          iconPath: "assets/image/home_icon/wakatime_icon.svg",
          title: "와카타임",
          content: "지금까지 한 운동 시간을\n확인해 보세요.",
        ),
      ],
    );
  }
}
