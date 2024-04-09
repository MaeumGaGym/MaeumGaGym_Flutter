import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/provider/pose_tag_list_provider.dart';
import '../../../../../config/maeumgagym_color.dart';
import '../provider/pose_part_selector_provider.dart';
import '../provider/pose_tab_provider.dart';
import '../widget/tab/pose_tab_text_widget.dart';

/// PoseMainScreen에 있는 TabBar
class PoseMainTabBar extends ConsumerStatefulWidget {
  final List<String> tabBodyData;
  final List<String> tabBarData;

  const PoseMainTabBar({
    super.key,
    required this.tabBarData,
    required this.tabBodyData,
  });

  @override
  ConsumerState<PoseMainTabBar> createState() => _PoseMainTabBarState();
}

class _PoseMainTabBarState extends ConsumerState<PoseMainTabBar>
    with SingleTickerProviderStateMixin {
  /// TabBar
  @override
  Widget build(BuildContext context) {
    final List<String> tabBarData = widget.tabBarData;

    final poseTabState = ref.watch(poseTabController);
    final poseTabNotifier = ref.read(poseTabController.notifier);

    final posePartNotifier = ref.watch(posePartSelectorController.notifier);

    return Stack(
      children: [
        /// Divider
        Padding(
          padding: const EdgeInsets.only(top: 54),
          child: Container(
            height: 2,
            color: MaeumgagymColor.gray50,
          ),
        ),

        /// TabBar 글씨
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: 56,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: tabBarData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      poseTabNotifier.state = index;
                      posePartNotifier.init(index);
                      ref.read(poseTagListController.notifier).getTagList(
                          tag:
                              widget.tabBodyData[ref.watch(poseTabController)]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          /// 하단 Border가 선택시 blue 아니면 gray
                          bottom: BorderSide(
                            width: 2,
                            color: poseTabState == index
                                ? MaeumgagymColor.blue500
                                : MaeumgagymColor.gray50,
                          ),
                        ),
                      ),

                      /// 글자가 선택시 black 아니면 gray
                      child: PoseTabTextWidget(
                        text: tabBarData[index],
                        color: poseTabState == index
                            ? MaeumgagymColor.black
                            : MaeumgagymColor.gray400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
