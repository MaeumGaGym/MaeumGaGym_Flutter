import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/goal/self_care_goal_detail_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/goal/widget/self_care_goal_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_title_container.dart';

class SelfCareGoalMainScreen extends StatelessWidget {
  const SelfCareGoalMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SelfCareDefaultTitleContainer(
                  title: "목표",
                  subTitle: "나만의 목표를 세워보세요.",
                ),
                const SizedBox(height: 32),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 30, // 임의로 넣은 아이템 갯수
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SelfCareGoalDetailScreen(),
                            ),
                          ),
                          child: const SelfCareGoalItemWidget(
                            title: "디자인 완성하기",
                            subTitle: "12월 26일 ~ 12월 27일",
                          ),
                        ),
                        SizedBox(height: index == 30 - 1 ? 0 : 12),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 98),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: MaeumgagymColor.white,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SelfCareMyRoutineButton(
                width: MediaQuery.of(context).size.width,
                height: 58,
                imageWidth: 24,
                imageHeight: 24,
                imagePath: "assets/image/self_care_icon/add_icon.svg",
                imageColor: MaeumgagymColor.white,
                title: "목표 추가하기",
                textColor: MaeumgagymColor.white,
                buttonColor: MaeumgagymColor.blue500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
