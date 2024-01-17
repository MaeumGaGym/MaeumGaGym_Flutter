/// Package
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Provider
import '../../provider/food_data_provider.dart';

class AddFoodTabBodyListWidget extends StatelessWidget {
  final int index, g, kcal;
  final String image, foodName;
  final bool selected;
  final FoodDataStateNotifier foodDataStateNotifier;

  const AddFoodTabBodyListWidget({
    super.key,
    required this.index,
    required this.g,
    required this.kcal,
    required this.image,
    required this.foodName,
    required this.selected,
    required this.foodDataStateNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// FoodImage
          Image.asset(
            image,
            width: 80,
            height: 80,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 160,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      /// FoodName
                      PtdTextWidget.labelMedium(
                          foodName, MaeumgagymColor.black),
                      const SizedBox(width: 10),

                      /// Food 그람수
                      PtdTextWidget.bodyMedium(
                        "${g}g",
                        MaeumgagymColor.gray200,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  /// Food 칼로리수
                  PtdTextWidget.bodyMedium(
                    "${kcal}kcal",
                    MaeumgagymColor.gray500,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => foodDataStateNotifier.toggleSelection(index),
            child: SvgPicture.asset(
              selected
                  ? 'assets/image/home_icon/check_circle_icon.svg'
                  : 'assets/image/home_icon/add_circle_icon.svg',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
