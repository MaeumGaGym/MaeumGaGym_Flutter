import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_routine_item_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/self_care_my_routine_add_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/container/self_care_my_routine_main_title_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareMyRoutineMainScreen extends ConsumerStatefulWidget {
  const SelfCareMyRoutineMainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareMyRoutineMainScreen> createState() =>
      _SelfCareGoalMainScreenState();
}

class _SelfCareGoalMainScreenState
    extends ConsumerState<SelfCareMyRoutineMainScreen> {
  @override
  Widget build(BuildContext context) {
    final routineItemState = ref.watch(selfCareRoutineItemProvider);
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SelfCareMyRoutineMainTitleContainer(),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  /// Notifier에 입력된 Model 개수만큼
                  itemCount: routineItemState.length,
                  itemBuilder: (context, index) {
                    /// 공통된 변수
                    final item = routineItemState[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: index == routineItemState.length - 1 ? 0 : 12),
                      child: SelfCareMyRoutineItemWidget(
                        title: item.title,
                        index: item.itemIndex,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: MaeumgagymColor.white,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelfCareMyRoutineAddScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SelfCareMyRoutineButton(
                width: MediaQuery.of(context).size.width,
                height: 58,
                imageWidth: 24,
                imageHeight: 24,
                imagePath: "assets/image/self_care_icon/add_icon.svg",
                imageColor: MaeumgagymColor.white,
                title: "루틴 추가하기",
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
