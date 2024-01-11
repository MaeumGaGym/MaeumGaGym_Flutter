import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_routine_item_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/goal/widget/self_care_goal_main_title.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/goal/widget/self_care_goal_routine_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareGoalMainScreen extends ConsumerStatefulWidget {
  const SelfCareGoalMainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareGoalMainScreen> createState() => _SelfCareGoalMainScreenState();
}

class _SelfCareGoalMainScreenState extends ConsumerState<SelfCareGoalMainScreen> {
  @override
  Widget build(BuildContext context) {
    final routineItemState = ref.watch(selfCareRoutineItemProvider);
    return Scaffold(
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SelfCareGoalMainTitle(),
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
                    child: SelfCareGoalRoutineItemWidget(
                      title: item.title,
                      isKept: item.isKept,
                      isShared: item.isShared,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
