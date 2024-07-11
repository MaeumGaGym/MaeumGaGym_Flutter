import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/view/pose_detail_screen.dart';
import 'package:maeum_ga_gym_flutter/routine_start/presentation/provider/routine_start_exercise_provider.dart';
import 'package:maeum_ga_gym_flutter/routine_start/presentation/provider/routine_start_page_view_provider.dart';
import 'package:maeum_ga_gym_flutter/routine_start/presentation/widget/routine_start_main_bottom_sheet.dart';
import 'package:maeum_ga_gym_flutter/routine_start/presentation/widget/routine_start_main_list_widget.dart';
import '../../../core/model/routine/maeumgagym_routine_list_model.dart';
import '../widget/routine_start_main_app_bar.dart';

class RoutineStartMainScreen extends ConsumerStatefulWidget {
  final int routineId;
  final List<ExerciseInfoList> routineList;

  const RoutineStartMainScreen({
    super.key,
    required this.routineId,
    required this.routineList,
  });

  @override
  ConsumerState<RoutineStartMainScreen> createState() =>
      _RoutineStartMainScreenState();
}

class _RoutineStartMainScreenState
    extends ConsumerState<RoutineStartMainScreen> {
  final ScrollController _scrollController = ScrollController();
  double _containerHeight = 200.0;

  Duration doExerciseTime = const Duration(seconds: 0);
  late StreamSubscription<int> stream;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    stream = Stream.periodic(
      const Duration(seconds: 1),
          (x) => x,
    ).listen((event) {
      doExerciseTime = Duration(seconds: event + 1);
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(routineStartExerciseProvider).routineId != widget.routineId ||
          ref.read(routineStartExerciseProvider).exercises.length != widget.routineList.length) {
        ref
            .read(routineStartExerciseProvider.notifier)
            .setRoutineStartModel(widget.routineId, widget.routineList);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    stream.cancel();
    super.dispose();
  }

  void _onScroll() {
    const double maxHeight = 200.0;
    const double minHeight = 160.0;

    setState(() {
      _containerHeight = maxHeight - (_scrollController.offset / 5).clamp(0.0, maxHeight - minHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    final exerciseRoutineList = ref.watch(routineStartExerciseProvider).exercises;

    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: RoutineStartMainAppBar(
        time: doExerciseTime,
        routineLength: exerciseRoutineList.length,
      ),
      bottomSheet: const RoutineStartMainBottomSheet(),
      body: SafeArea(
        child: PageView.builder(
          onPageChanged: (value) => ref.read(routineStartPageViewProvider.notifier).state = value,
          itemCount: exerciseRoutineList.length,
          itemBuilder: (context, pageViewIndex) {
            final routineData = exerciseRoutineList[pageViewIndex];

            return Column(
              children: [
                // 사진
                AnimatedContainer(
                  duration: const Duration(microseconds: 100),
                  width: MediaQuery.of(context).size.width,
                  height: _containerHeight,
                  color: MaeumgagymColor.gray25,
                  child: Center(
                    child: ImageWidget(
                      height: _containerHeight,
                      imageType: ImageType.pngNetwork,
                      image: routineData.thumbnail!,
                    ),
                  ),
                ),
                // 운동 이름 및 info
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PtdTextWidget.titleMedium(
                            routineData.name!,
                            MaeumgagymColor.black,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PoseDetailScreen(
                                    id: widget.routineList[pageViewIndex].pose.id!,
                                    poseData: widget.routineList[pageViewIndex].pose,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 28,
                              decoration: BoxDecoration(
                                color: MaeumgagymColor.gray50,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: ImageWidget(
                                  width: 16,
                                  image: Images.iconsNotDesignSysInfoIcon,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          PtdTextWidget.labelMedium(
                            "횟수",
                            MaeumgagymColor.gray600,
                          ),
                          const SizedBox(width: 4),
                          PtdTextWidget.labelLarge(
                            (routineData.repetitions! * routineData.sets!)
                                .toString(),
                            MaeumgagymColor.blue500,
                          ),
                          PtdTextWidget.labelMedium(
                              "회", MaeumgagymColor.blue500),
                        ],
                      )
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Center(
                          child: PtdTextWidget.bodyMedium(
                              "세트", MaeumgagymColor.gray500),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Center(
                            child: PtdTextWidget.bodyMedium(
                                "회", MaeumgagymColor.gray500)),
                      ),
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: PtdTextWidget.bodyMedium(
                              "완료", MaeumgagymColor.gray500),
                        ),
                      ),
                    ],
                  ),
                ),

                // list들
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: routineData.sets!,
                    itemBuilder: (context, listViewIndex) {
                      return RoutineStartMainListWidget(
                        onComplete: () {
                          ref
                              .read(routineStartExerciseProvider.notifier)
                              .setComplete(pageViewIndex, listViewIndex);
                          setState(() {});
                        },
                        pageViewIndex: pageViewIndex,
                        listViewIndex: listViewIndex,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
