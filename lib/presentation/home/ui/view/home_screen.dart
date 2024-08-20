import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/presentation/home/ui/widget/home_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/home/ui/widget/home_bottom_space.dart';
import 'package:maeumgagym_flutter/presentation/quotes/ui/widget/quotes_container.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/container/today_routine_container.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/container/timer_metronome_container.dart';

import '../../../../core/maeum/maeum_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      /// Home AppBar
      appBar: const HomeAppBar(),

      /// Home Body
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            /// BackGround 그라데이션 설정
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                MaeumColor.white,
                MaeumColor.blue50,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                /// 인용문 Container
                const QuotesContainer(),

                SizedBox(height: 24.h),

                /// 오늘의 루틴 Container
                const TodayRoutineContainer(),

                const SizedBox(height: 24),

                /// Timer Metronome Container
                const TimerMetronomeContainer(),

                // // const HomeMainWalkContainer(),
                // // const HomeMainTodayMealContainer(),
                // // const SizedBox(height: 24),
                // // const HomeMainContentListContainer(),
                // // const SizedBox(height: 24),
                const HomeBottomSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
