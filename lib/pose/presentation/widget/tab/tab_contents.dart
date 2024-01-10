/// Package
import 'package:flutter/material.dart';

/// Screen
import '../../view/pose_part_screen.dart';
import '../../view/pose_recommend_screen.dart';

class TabContents extends StatelessWidget {
  final Widget tabBar;
  final TabController tabController;

  const TabContents(
      {super.key, required this.tabController, required this.tabBar});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Tap Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(height: 56, child: tabBar),
        ),

        /// Tab Contents
        Expanded(
          child: TabBarView(
            controller: tabController,
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
