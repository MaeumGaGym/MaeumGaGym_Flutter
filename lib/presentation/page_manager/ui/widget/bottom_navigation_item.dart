import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/presentation/page_manager/view_model/page_manager_state_cubit.dart';

import '../../../../component/image_widget.dart';
import '../../../../core/maeum/maeum_text.dart';
import '../../../../core/maeum/maeum_color.dart';

class BottomNavigationItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    bool isSelected = context.watch<PageManagerStateCubit>().state == clickState;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        pageController.animateToPage(
          clickState,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        context.read<PageManagerStateCubit>().changeState(clickState);
      },
      child: SizedBox(
        width: (1.sw / 5).floorToDouble(),
        height: 64.h,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                image: isSelected ? selectedImage : image,
                width: 32.w,
                height: 32.h,
              ),
              MaeumText.bottomNavigationText(
                label,
                isSelected ? MaeumColor.black : MaeumColor.gray500,
              )
            ],
          ),
        ),
      ),
    );
  }
}