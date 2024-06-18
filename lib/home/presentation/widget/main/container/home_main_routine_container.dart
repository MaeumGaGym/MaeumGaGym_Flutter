import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_routine_page_index_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_today_routines_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_today_routine_screen.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/view/pose_detail_screen.dart';

import '../widget/home_main_routine_title.dart';

class HomeMainRoutineContainer extends ConsumerStatefulWidget {
  const HomeMainRoutineContainer({super.key});

  @override
  ConsumerState<HomeMainRoutineContainer> createState() =>
      _HomeMainRoutineContainerState();
}

class _HomeMainRoutineContainerState
    extends ConsumerState<HomeMainRoutineContainer> {
  late PageController routineContainerPageController;

  @override
  void initState() {
    super.initState();
    routineContainerPageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    routineContainerPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool errState = ref.watch(homeTodayRoutineController).routineList.isEmpty;

    final todayRoutineList = ref.watch(homeTodayRoutineController).routineList;

    final int routinePageIndex = ref.watch(homeRoutinePageIndexProvider);

    return Container(
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  if (!errState) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeTodayRoutineScreen(
                          routineListIndex: routinePageIndex,
                        ),
                      ),
                    );
                  }
                },
                child: HomeMainRoutineTitle(
                  title: "오늘의 루틴",
                  routineName: errState
                      ? null
                      : todayRoutineList[routinePageIndex].routineName!,
                  routineIsComplete: errState
                      ? null
                      : todayRoutineList[routinePageIndex].isCompleted!,
                ),
              ),
            ),
            Builder(
              builder: (context) {
                if (errState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: PtdTextWidget.bodyLarge(
                      '오늘의 루틴이 없어요',
                      MaeumgagymColor.gray400,
                    ),
                  );
                }
                return SizedBox(
                  height: 64 *
                      todayRoutineList[routinePageIndex]
                          .exerciseInfoResponseList!
                          .length *
                      1.0,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: routineContainerPageController,
                    onPageChanged: (value) => setState(() => ref
                        .watch(homeRoutinePageIndexProvider.notifier)
                        .state = value),
                    itemCount: todayRoutineList.length,
                    itemBuilder: (context, pageIndex) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: todayRoutineList[pageIndex]
                            .exerciseInfoResponseList!
                            .length,
                        itemBuilder: (context, index) {
                          final pageRoutinePageData =
                              todayRoutineList[pageIndex]
                                  .exerciseInfoResponseList![index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PoseDetailScreen(
                                    id: pageRoutinePageData.pose.id!,
                                    poseData: pageRoutinePageData.pose,
                                  ),
                                )),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 48,
                                            width: 48,
                                            decoration: BoxDecoration(
                                              color: MaeumgagymColor.gray100,
                                              shape: BoxShape.circle,
                                            ),
                                            child: ImageWidget(
                                              image: pageRoutinePageData
                                                  .pose.thumbnail!,
                                              imageType: ImageType.pngNetwork,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              PtdTextWidget.titleSmall(
                                                pageRoutinePageData.pose.name!,
                                                MaeumgagymColor.black,
                                              ),
                                              const SizedBox(height: 2),
                                              PtdTextWidget.bodySmall(
                                                "${pageRoutinePageData.repetitions}개 | ${pageRoutinePageData.sets}세트",
                                                MaeumgagymColor.gray400,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        child: SvgPicture.asset(
                                          'assets/image/core_icon/right_arrow_icon.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 52,
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: todayRoutineList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: index == routinePageIndex
                            ? MaeumgagymColor.blue500
                            : MaeumgagymColor.gray100,
                        shape: BoxShape.circle,
                      ),
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
