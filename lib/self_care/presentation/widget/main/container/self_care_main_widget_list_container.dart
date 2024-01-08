import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/widget/self_care_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_dummy.dart';

class SelfCareMainWidgetListContainer extends StatelessWidget {
  const SelfCareMainWidgetListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PtdTextWidget.titleMedium(
              "자기관리",
              MaeumgagymColor.black,
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return SelfCareItemWidget(
                imagePath: selfCareWidgetItemList.keys.elementAt(index),
                title: selfCareWidgetItemList.values.elementAt(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
