import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/view/pose_add_routine_detail_screen.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/add_routine/pose_add_routine_app_bar.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/add_routine/pose_routine_item_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/widget/routine_default_title_widget.dart';

import '../../../core/component/pose/domain/model/pose_data_model.dart';

class PoseAddRoutineScreen extends ConsumerStatefulWidget {
  final String routineName;
  final String poseSimpleName, poseExactName;
  final PoseDataModel poseData;

  const PoseAddRoutineScreen({
    super.key,
    required this.routineName,
    required this.poseData,
    required this.poseSimpleName,
    required this.poseExactName,
  });

  @override
  ConsumerState<PoseAddRoutineScreen> createState() =>
      _PoseAddRoutineScreenState();
}

class _PoseAddRoutineScreenState extends ConsumerState<PoseAddRoutineScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(listener);
    Future.delayed(
      Duration.zero,
      () => ref.read(routineMyRoutinesProvider.notifier).getMyRoutineInit(),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void listener() {
    final myRoutineState = ref.watch(routineMyRoutinesProvider);

    /// ~/ => 나눈 몫을 정수형으로 반환
    int pageIndex = myRoutineState.routineList.length ~/ 10;
    bool hasMore = myRoutineState.routineList.length % 10 != 0 ? false : true;

    /// 화면 스크롤 컨트롤러의 위치가 최대 스크롤 위치이면서 API가 로딩 중이 아닐 때 (API가 실행 중이 아닐 때)
    /// => 중복 요청 방지
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !myRoutineState.statusCode.isLoading) {
      /// 리스트의 데이터 갯수를 10으로 나눈 나머지가 0이 아닐 때, 즉 데이터가 10으로 나눠떨어지지 않을 때 계속해서 값이 호출되고, 리스트에 추가되는 경우를 방지
      if (hasMore) {
        ref
            .read(routineMyRoutinesProvider.notifier)
            .getMyRoutine(index: pageIndex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final myRoutineState = ref.watch(routineMyRoutinesProvider);
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const PoseAddRoutineAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoutineDefaultTitleContainer(
                  title: "루틴에 추가",
                  subTitle: "${widget.routineName}을 추가하고 싶은\n루틴을 선택하세요",
                ),
                const SizedBox(height: 32),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  /// Notifier에 입력된 Model 개수만큼
                  itemCount: myRoutineState.routineList.length,
                  itemBuilder: (context, index) {
                    /// 공통된 변수
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: index == myRoutineState.routineList.length - 1
                              ? 0
                              : 12),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PoseAddRoutineDetailScreen(
                              routineIndex: index,
                              routineName: myRoutineState
                                  .routineList[index].routineName!,
                              poseSimpleName: widget.poseSimpleName,
                              poseExactName: widget.poseExactName,
                              poseData: widget.poseData,
                            ),
                          ),
                        ),
                        child: PoseRoutineItemWidget(
                          listIndex: index,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
