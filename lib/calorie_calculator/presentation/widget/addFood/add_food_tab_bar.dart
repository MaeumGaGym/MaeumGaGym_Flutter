/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Provider
import 'package:maeum_ga_gym_flutter/calorie_calculator/presentation/provider/food_tab_bar_controller.dart';

class AddFoodTabBar extends ConsumerWidget {
  const AddFoodTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(foodTabController);
    final tabControllerNotifier = ref.read(foodTabController.notifier);

    /// Tab에 들어갈 데이터
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

    /// Tab의 Border를 관리하는 함수
    BorderSide borderSide(bool state) {
      if (state) {
        return BorderSide(width: 2, color: MaeumgagymColor.gray50);
      } else {
        return BorderSide.none;
      }
    }

    /// 양엽 Tab Padding
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
          /// Tab Padding
          tabPadding(),
          SizedBox(
            height: 44,

            /// Tab을 구현하기 위한 ListView.builder
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: tabData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    /// BorderSide가 none이 되면 2만큼 주변 크기가 줄어듬 그것을 방지
                    top: tabController.index == index ? 0 : 2,
                  ),
                  child: GestureDetector(
                    onTap: () => tabControllerNotifier.saveIndex(index),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          /// bottom을 제외한 나머지는 Tab이 선택되면 생김
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
                            /// bottom Boder가 Tab이 선택되면 사라짐
                            bottom: borderSide(
                              !(tabController.index == index),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,

                            /// BorderSide가 white가 되면 디자인과 맞지 않아 bottom BorderSide를 줄려 디자인과 맞춤
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
