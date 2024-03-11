import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/pedometer/widget/home_pedometer_detail_item_widget.dart';

class HomePedometerDetailItemListContainer extends StatelessWidget {
  const HomePedometerDetailItemListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomePedometerDetailItemWidget(
          title: "이동시간",
          value: "1.3km",
        ),
        HomePedometerDetailItemWidget(
          title: "칼로리",
          value: "20kcal",
        ),
        HomePedometerDetailItemWidget(
          title: "시간",
          value: "0시간 20분",
        ),
      ],
    );
  }
}
