import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_main_screen.dart';
import 'package:maeum_ga_gym_flutter/page_manager/presentation/animated_indexed_stack_screen.dart';
import 'package:maeum_ga_gym_flutter/page_manager/provider/page_manager_controller.dart';
import '../../pose/presentation/view/pose_tab_screen.dart';

class PageManagerScreen extends ConsumerWidget {
  const PageManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageControllerIndex = ref.watch(pageControllerProvider).index;
    final pageControllerNotifier = ref.read(pageControllerProvider.notifier);

    final List<Widget> screenData = [
      const HomeMainScreen(),
      const PoseTabScreen(),
      Container(color: Colors.red),
      Container(color: Colors.blue),
      Container(color: Colors.green),
    ];

    return Scaffold(
      body: AnimatedIndexedStack(
        index: pageControllerIndex,
        children: screenData,
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: pageControllerIndex,
          onTap: (value) => pageControllerNotifier.setPage(value),
          selectedItemColor: MaeumgagymColor.black,
          unselectedItemColor: MaeumgagymColor.gray500,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: pretendard,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: pretendard,
            fontSize: 12,
          ),
          selectedFontSize: 12,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/image/bottom_navigation_bar_icon/home_icon${pageControllerIndex == 0 ? '_filled' : ''}.svg',
                width: 32,
                height: 32,
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/image/bottom_navigation_bar_icon/pose_icon${pageControllerIndex == 1 ? '_filled' : ''}.svg',
                width: 32,
                height: 32,
              ),
              label: '자세',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/image/bottom_navigation_bar_icon/cart_icon${pageControllerIndex == 2 ? '_filled' : ''}.svg',
                width: 32,
                height: 32,
              ),
              label: '샵',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/image/bottom_navigation_bar_icon/pickle_icon${pageControllerIndex == 3 ? '_filled' : ''}.svg',
                width: 32,
                height: 32,
              ),
              label: '피클',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/image/bottom_navigation_bar_icon/arm_icon${pageControllerIndex == 4 ? '_filled' : ''}.svg',
                width: 32,
                height: 32,
              ),
              label: '자기관리',
            ),
          ],
        ),
      ),
    );
  }
}
