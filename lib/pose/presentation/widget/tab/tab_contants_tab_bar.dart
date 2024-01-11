import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/provider/tab/pose_tab_controller.dart';

import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class TabContentsTabBar extends ConsumerWidget {
  final List<String> tabData;

  const TabContentsTabBar({super.key, required this.tabData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(poseTabController);
    final tabControllerNotifier = ref.read(poseTabController.notifier);

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: tabData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => tabControllerNotifier.saveIndex(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: tabController.index == index
                        ? MaeumgagymColor.blue500
                        : MaeumgagymColor.gray50,
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                child: PtdTextWidget.labelLarge(
                  tabData[index],
                  tabController.index == index
                      ? MaeumgagymColor.black
                      : MaeumgagymColor.gray400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
