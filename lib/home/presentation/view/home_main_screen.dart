import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/container/home_main_timer_and_metronome_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/container/home_main_pedometer_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/widget/home_main_app_bar.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/container/home_main_content_list_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/container/home_main_routine_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/container/home_main_today_meal_container.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeMainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // backgroundColor는 그라데이션 설정이 안돼서 이렇게 함
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                MaeumgagymColor.white,
                MaeumgagymColor.blue50,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // 왼쪽, 오른쪽 패딩 한번에 줌
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 위젯 왼쪽 정렬
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: PtdTextWidget.titleMedium(
                    "\"가능성은 한계를 넘는다.\"",
                    MaeumgagymColor.blue500,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: PtdTextWidget.labelMedium(
                    "Kimain",
                    MaeumgagymColor.gray500,
                  ),
                ),
                const SizedBox(height: 24),
                const HomeMainWalkContainer(),
                const SizedBox(height: 24),
                const HomeMainRoutineContainer(),
                const SizedBox(height: 24),
                const HomeMainTimeAndMetronomeContainer(),
                const SizedBox(height: 24),
                const HomeMainTodayMealContainer(),
                const SizedBox(height: 24),
                const HomeMainContentListContainer(),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Column(
                      children: [
                        PtdTextWidget.labelSmall(
                          "©2023 마음가짐",
                          MaeumgagymColor.gray400,
                          null, // 값이 없으면 null로 해줘야합니다. nullable하게 변수 선언해줬다고 해도
                          null,
                        ),
                        const SizedBox(height: 8),
                        PtdTextWidget.labelLarge(
                          "개인정보 처리방침 보기",
                          MaeumgagymColor.gray400,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
