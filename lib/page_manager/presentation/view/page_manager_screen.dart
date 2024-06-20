import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/empty_view/view/empty_view_screen.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_main_screen.dart';
import 'package:maeum_ga_gym_flutter/page_manager/presentation/view/animated_indexed_stack_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/self_care_main_screen.dart';
import '../../../pose/presentation/view/pose_main_screen.dart';
import '../provider/page_manager_controller.dart';

class PageManagerScreen extends ConsumerWidget {
  const PageManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageControllerIndex = ref.watch(pageControllerProvider).index;
    final pageControllerNotifier = ref.read(pageControllerProvider.notifier);

    final List<Widget> screenData = [
      const HomeMainScreen(),
      const PoseMainScreen(),
      const EmptyViewScreen(isTap: true),
      const EmptyViewScreen(isTap: true),
      const SelfCareMainScreen(),
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
          elevation: 0,
          backgroundColor: MaeumgagymColor.white,
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
              icon: ImageWidget(
                image: pageControllerIndex == 0
                    ? Images.iconsHouseFilled
                    : Images.iconsHouse,
                width: 32,
                height: 32,
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: ImageWidget(
                image: pageControllerIndex == 1
                    ? Images.iconsPoseFilled
                    : Images.iconsPose,
                width: 32,
                height: 32,
              ),
              label: '자세',
            ),
            BottomNavigationBarItem(
              icon: ImageWidget(
                image: pageControllerIndex == 2
                    ? Images.iconsCartFilled
                    : Images.iconsCart,
                width: 32,
                height: 32,
              ),
              label: '샵',
            ),
            BottomNavigationBarItem(
              icon: ImageWidget(
                image: pageControllerIndex == 3
                    ? Images.iconsPickleFilled
                    : Images.iconsPickle,
                width: 32,
                height: 32,
              ),
              label: '피클',
            ),
            BottomNavigationBarItem(
              icon: ImageWidget(
                image: pageControllerIndex == 4
                    ? Images.iconsArmFilled
                    : Images.iconsArm,
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
