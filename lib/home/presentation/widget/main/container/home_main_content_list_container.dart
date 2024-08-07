import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/widget/home_main_content_widget.dart';

class HomeMainContentListContainer extends StatelessWidget {
  const HomeMainContentListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView(
        scrollDirection: Axis.horizontal, // 가로 스크롤 설정
        children: const [
          HomeMainContentWidget(
            iconPath: Images.iconsNotDesignSysCalculateIcon,
            title: "칼로리 계산기",
            content: "먹은 음식의 칼로리를\n계산해 보세요.",
          ),
          SizedBox(width: 12),
          HomeMainContentWidget(
            iconPath: Images.iconsNotDesignSysWakatimeIcon,
            title: "와카타임",
            content: "지금까지 한 운동 시간을\n확인해 보세요.",
          ),
        ],
      ),
    );
  }
}
