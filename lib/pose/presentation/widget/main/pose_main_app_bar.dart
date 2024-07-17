/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Screen
import '../../view/pose_search_screen.dart';

/// Provider
import '../../provider/pose_search_provider.dart';

class PoseMainTabAppBar extends ConsumerWidget {
  final bool innerBoxIsScrolled;

  const PoseMainTabAppBar({super.key, required this.innerBoxIsScrolled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        backgroundColor: MaeumgagymColor.white,
        surfaceTintColor: MaeumgagymColor.white,

        /// Search_Icon
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
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

                  ref.read(poseSearchController.notifier).state = '';
                },
                child: const ImageWidget(
                  image: Images.iconsSearch,
                  width: 28,
                  height: 28,
                ),
              ),
            ],
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
