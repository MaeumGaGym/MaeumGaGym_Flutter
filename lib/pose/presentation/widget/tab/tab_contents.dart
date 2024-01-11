/// Package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/tab/tab_contants_tab_bar.dart';

/// Screen
import '../../view/pose_part_screen.dart';
import '../../view/pose_recommend_screen.dart';

class TabContents extends StatelessWidget {
  final List<String> tabBar;
  final TabController tabController;

  const TabContents(
      {super.key, required this.tabController, required this.tabBar});

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 56,
                child: TabContentsTabBar(tabData: tabBar),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
