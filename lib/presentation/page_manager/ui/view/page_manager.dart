import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/presentation/empty_view/view/empty_view_screen.dart';
import 'package:maeumgagym_flutter/presentation/home/ui/view/home_screen.dart';
import 'package:maeumgagym_flutter/presentation/pickle/ui/view/pickle_screen.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/view/pose_main_screen.dart';
import 'package:maeumgagym_flutter/presentation/self_care/ui/view/self_care_screen.dart';

import '../../../../core/images.dart';
import '../../../../core/maeum/maeum_color.dart';
import '../widget/bottom_navigation_item.dart';

class PageManagerScreen extends StatelessWidget {
  const PageManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    final List<Widget> screenData = [
      const HomeScreen(),
      const PoseMainScreen(),
      const EmptyViewScreen(),
      const PickleScreen(),
      const SelfCareScreen(),
    ];

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: screenData,
      ),
      bottomNavigationBar: Container(
        height: 64.h,
        color: MaeumColor.white,
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