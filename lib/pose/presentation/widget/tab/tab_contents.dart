/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/view/pose_tab_bar.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/view/pose_tab_body.dart';

class TabContents extends ConsumerWidget {
  const TabContents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        /// Tap Bar
        PoseTabBar(),

        /// Tab Contents
        PoseTabBody(useNavigator: true),
      ],
    );
  }
}
