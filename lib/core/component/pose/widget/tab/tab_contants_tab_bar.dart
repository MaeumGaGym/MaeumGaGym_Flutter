/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import '../../../text/pretendard/ptd_text_widget.dart';

/// Provider
import 'package:maeum_ga_gym_flutter/core/component/pose/provider/pose_tab_controller.dart';

import '../../provider/pose_part_selector_controller.dart';

class TabContentsTabBar extends ConsumerWidget {
  const TabContentsTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// TabBar
    final List<String> tabData = [
      '추천',
      '맨몸',
      '기구',
      '가슴',
      '등',
      '어깨',
      '팔',
      '복근',
      '앞 허벅지',
      '뒷 허벅지',
      '종아리',
    ];

    final poseTabControllerState = ref.watch(poseTabController);
    final poseTabControllerStateNotifier = ref.read(poseTabController.notifier);

    final posePartStateNotifier =
        ref.watch(posePartSelectorController.notifier);

    /// Tab을 구현하기 위한 ListViewBuilder
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: tabData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              poseTabControllerStateNotifier.saveIndex(index);
              posePartStateNotifier.init(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  /// 하단 Border가 선택시 blue 아니면 gray
                  bottom: BorderSide(
                    width: 2,
                    color: poseTabControllerState.index == index
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

                  /// 글자가 선택시 black 아니면 gray400
                  poseTabControllerState.index == index
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
