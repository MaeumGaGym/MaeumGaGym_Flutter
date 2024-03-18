import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareTodayExerciseCameraScreen extends StatelessWidget {
  const SelfCareTodayExerciseCameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 이건 새로 이슈 파서 진행할겁니다.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: index == 0 || index == 3 ? 0 : 32),
                PtdTextWidget.labelMedium(
                  "2023년 12월",
                  MaeumgagymColor.blue500,
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      color: MaeumgagymColor.blue100,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
