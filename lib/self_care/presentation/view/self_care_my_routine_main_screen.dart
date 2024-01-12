import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_routine_item_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_main_title.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareMyRoutineMainScreen extends ConsumerStatefulWidget {
  const SelfCareMyRoutineMainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareMyRoutineMainScreen> createState() => _SelfCareGoalMainScreenState();
}

class _SelfCareGoalMainScreenState extends ConsumerState<SelfCareMyRoutineMainScreen> {
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
            const SelfCareMyRoutineMainTitle(),
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
    );
  }
}
