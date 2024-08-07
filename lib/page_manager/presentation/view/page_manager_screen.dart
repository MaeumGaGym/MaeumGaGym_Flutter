import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/empty_view/view/empty_view_screen.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_main_screen.dart';
import 'package:maeum_ga_gym_flutter/page_manager/presentation/view/bottom_navigation_item.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/self_care_main_screen.dart';
import '../../../pose/presentation/view/pose_main_screen.dart';

class PageManagerScreen extends ConsumerWidget {
  const PageManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();

    final List<Widget> screenData = [
      const HomeMainScreen(),
      const PoseMainScreen(),
      const EmptyViewScreen(isTap: true),
      const EmptyViewScreen(isTap: true),
      const SelfCareMainScreen(),
    ];

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: screenData,
      ),
      bottomNavigationBar: Container(
        height: 64,
        color: MaeumgagymColor.white,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationItem(
              pageController: pageController,
              label: "홈",
              clickState: 0,
              selectedImage: Images.iconsHouseFilled,
              image: Images.iconsHouse,
            ),
            BottomNavigationItem(
              pageController: pageController,
              label: "자세",
              clickState: 1,
              selectedImage: Images.iconsPoseFilled,
              image: Images.iconsPose,
            ),
            BottomNavigationItem(
              pageController: pageController,
              label: "샵",
              clickState: 2,
              selectedImage: Images.iconsCartFilled,
              image: Images.iconsCart,
            ),
            BottomNavigationItem(
              pageController: pageController,
              label: "피클",
              clickState: 3,
              selectedImage: Images.iconsPickleFilled,
              image: Images.iconsPickle,
            ),
            BottomNavigationItem(
              pageController: pageController,
              label: "자기관리",
              clickState: 4,
              selectedImage: Images.iconsArmFilled,
              image: Images.iconsArm,
            ),
          ],
        ),
      ),
    );
  }
}
