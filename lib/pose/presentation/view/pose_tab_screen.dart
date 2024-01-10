/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

/// Screen
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/tab/tab_app_bar.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/tab/tab_contents.dart';
import '../widget/tab/tab_widget.dart';

class PoseTabScreen extends ConsumerStatefulWidget {
  const PoseTabScreen({super.key});

  @override
  ConsumerState<PoseTabScreen> createState() => _PoseTabScreenState();
}

class _PoseTabScreenState extends ConsumerState<PoseTabScreen>
    with SingleTickerProviderStateMixin {
  /// TabBar Controller
  late TabController tabController = TabController(
    initialIndex: 0,
    length: 9,
    vsync: this,
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  /// TabBar
  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.values.last,
      indicatorColor: MaeumgagymColor.blue500,
      dividerHeight: 2,
      dividerColor: MaeumgagymColor.gray50,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      overlayColor: MaterialStateProperty.all(MaeumgagymColor.white),
      tabs: const [
        TabWidget('추천'),
        TabWidget('가슴'),
        TabWidget('등'),
        TabWidget('어깨'),
        TabWidget('팔'),
        TabWidget('복근'),
        TabWidget('앞 허벅지'),
        TabWidget('뒷 허벅지'),
        TabWidget('종아리'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              /// TabAppBar
              TabAppBar(innerBoxIsScrolled: innerBoxIsScrolled),
            ];
          },

          /// TabContents
          body: TabContents(tabBar: _tabBar(), tabController: tabController),
        ),
      ),
    );
  }
}
