/// Package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/provider/tab/pose_tab_controller.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/tab/tab_contants_tab_bar.dart';

/// Screen
import '../../view/pose_part_screen.dart';
import '../../view/pose_recommend_screen.dart';

class TabContents extends ConsumerWidget {
  final TabController tabController;

  const TabContents({super.key, required this.tabController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        /// Tap Bar
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 54),
              child: Container(
                height: 2,
                color: MaeumgagymColor.gray50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 56,
                child: TabContentsTabBar(),
              ),
            ),
          ],
        ),

        /// Tab Contents
        Expanded(
          child: IndexedStack(
            index: ref.watch(poseTabController).index,
            children: const [
              PoseReCommendScreen(),
              PosePartScreen(
                tabName: ['상체', '가슴'],
              ),
              PosePartScreen(
                tabName: ['상체', '등'],
              ),
              PosePartScreen(
                tabName: ['상체', '어깨'],
              ),
              PosePartScreen(
                tabName: ['상체', '팔'],
              ),
              PosePartScreen(
                tabName: ['상체', '복근'],
              ),
              PosePartScreen(
                tabName: ['하체', '앞 허벅지'],
              ),
              PosePartScreen(
                tabName: ['하체', '뒷 허벅지'],
              ),
              PosePartScreen(
                tabName: ['하체', '종아리'],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
