import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

import '../../../core/component/image_widget.dart';
import '../provider/page_manager_controller.dart';

class BottomNavigationItem extends ConsumerWidget {
  final int clickState;
  final String label;
  final String selectedImage, image;
  final PageController pageController;

  const BottomNavigationItem({
    super.key,
    required this.label,
    required this.image,
    required this.selectedImage,
    required this.clickState,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageControllerNotifier = ref.read(pageControllerProvider.notifier);
    final bool isSelected = ref.watch(pageControllerProvider) == clickState;

    return GestureDetector(
      onTap: () {
        pageController.animateToPage(
          clickState,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        pageControllerNotifier.state = clickState;
      },
      child: SizedBox(
        height: 64,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                image: isSelected ? selectedImage : image,
                width: 32,
                height: 32,
              ),
              PtdTextWidget.bottomNavigationText(
                label,
                isSelected ? MaeumgagymColor.black : MaeumgagymColor.gray500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
