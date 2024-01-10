/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Screen
import '../../view/pose_search_screen.dart';

/// Provider
import '../../provider/pose_search_controller.dart';

class TabAppBar extends ConsumerWidget {
  final bool innerBoxIsScrolled;

  const TabAppBar({super.key, required this.innerBoxIsScrolled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        /// Search_Icon
        title: SizedBox(
          height: 52,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PoseSearchScreen(),
                      ),
                    );

                    ref.read(poseSearchController.notifier).setText();
                  },
                  child: SvgPicture.asset(
                    'assets/image/core_icon/search_icon.svg',
                  ),
                ),
              ],
            ),
          ),
        ),

        /// 자세 글씨
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PtdTextWidget.titleLarge('자세', MaeumgagymColor.black),
              ],
            ),
          ),
        ),

        /// 화면 내릴때 고정이 되지 않음
        pinned: false,
        expandedHeight: 100,
        forceElevated: innerBoxIsScrolled,
      ),
    );
  }
}
