import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/pedometer/container/home_pedometer_detail_item_list_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/pedometer/container/home_pedometer_progress_container.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/pedometer/widget/home_pedometer_add_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/pedometer/widget/home_pedometer_app_bar.dart';

class HomeWalkDetailScreen extends StatelessWidget {
  const HomeWalkDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const HomePedometerAppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              /// 걸음수를 나타내는 진행률 위젯
              HomePedometerProgressContainer(),
              /// 걸음수의 세부사항을 나열한 리스트
              HomePedometerDetailItemListContainer(),
              /// pedometer를 홍 위젯에 연동하는 버튼
              HomePedometerAddWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
