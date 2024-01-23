/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Screen
import '../../../../config/maeumgagym_color.dart';
import '../widget/tab/tab_contants_tab_bar.dart';

class PoseTabBar extends ConsumerStatefulWidget {
  const PoseTabBar({super.key});

  @override
  ConsumerState<PoseTabBar> createState() => _PoseTabScreenState();
}

class _PoseTabScreenState extends ConsumerState<PoseTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: 56,
            child: TabContentsTabBar(),
          ),
        ),
      ],
    );
  }
}
