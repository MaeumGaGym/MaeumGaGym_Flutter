import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_tab_bar_controller.dart';

import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class AddFoodTabBar extends ConsumerWidget {
  const AddFoodTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(foodTabController);
    final tabControllerNotifier = ref.read(foodTabController.notifier);

    List<String> tabData = [
      "MY",
      "전체",
      "과자/아이스크림",
      "음료",
      "과일/견과류",
      "한식",
      "양식/중식",
      "패스트푸드",
    ];

    BorderSide borderSide(bool state) {
      if (state) {
        return BorderSide(width: 2, color: MaeumgagymColor.gray50);
      } else {
        return BorderSide.none;
      }
    }

    Padding tabPadding() {
      return Padding(
        padding: const EdgeInsets.only(top: 42),
        child: Container(
          width: 12,
          height: 2,
          color: MaeumgagymColor.gray50,
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          tabPadding(),
          SizedBox(
            height: 44,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: tabData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: tabController.index == index ? 0 : 2,
                  ),
                  child: GestureDetector(
                    onTap: () => tabControllerNotifier.saveIndex(index),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          top: borderSide(tabController.index == index),
                          left: borderSide(tabController.index == index),
                          right: borderSide(tabController.index == index),
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: borderSide(
                              !(tabController.index == index),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: tabController.index == index ? 14 : 16,
                          ),
                          child: PtdTextWidget.bodyMedium(
                            tabData[index],
                            tabController.index == index
                                ? MaeumgagymColor.black
                                : MaeumgagymColor.gray700,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          tabPadding(),
        ],
      ),
    );
  }
}
