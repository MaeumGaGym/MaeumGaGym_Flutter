/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/provider/tab/pose_tab_controller.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/tab/tab_contants_tab_bar.dart';

/// Screen
import '../../view/pose_part_screen.dart';
import '../../view/pose_recommend_screen.dart';

class TabContents extends ConsumerWidget {
  const TabContents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<List<String>> tabNameList = [
      ['상체', '하체', '가슴', '등', '어깨', '팔', '복근', '앞 허벅지', '뒷 허벅지', '종아리'],
      ['상체', '하체', '가슴', '등', '어깨', '팔', '복근', '앞 허벅지', '뒷 허벅지', '종아리'],
      ['상체', '가슴'],
      ['상체', '등'],
      ['상체', '어깨'],
      ['상체', '팔'],
      ['상체', '복근'],
      ['하체', '앞 허벅지'],
      ['하체', '뒷 허벅지'],
      ['하체', '종아리'],
    ];

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
            children: [
              const PoseReCommendScreen(),
              for (int i = 0; i < tabNameList.length; i++)
                PosePartScreen(
                  tabName: tabNameList[i],
                  nonePosePartSelector: i <= 1 ? true : false,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
