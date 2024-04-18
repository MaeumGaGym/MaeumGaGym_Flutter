import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_today_routines_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_today_routine_screen.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/widget/home_main_container_title.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/provider/pose_detail_provider.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/view/pose_detail_screen.dart';

class HomeMainRoutineContainer extends ConsumerWidget {
  const HomeMainRoutineContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool errState = ref
        .watch(homeTodayRoutineController)
        .statusCode
        .error
        .toString()
        .contains("type 'Null' is not");

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
                        builder: (context) => const HomeTodayRoutineScreen(),
                      ),
                    );

                    ref.read(poseDetailController.notifier).setDetailData();
                  }
                },
                child: const HomeMainContainerTitle(title: "오늘의 루틴"),
              ),
            ),
            ref.watch(homeTodayRoutineController).statusCode.when(data: (data) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ref
                    .watch(homeTodayRoutineController)
                    .exerciseInfoResponseList!
                    .length,
                itemBuilder: (context, index) {
                  // String key = routineData.keys.elementAt(index);
                  final poseData = ref
                      .read(homeTodayRoutineController)
                      .exerciseInfoResponseList![index];
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoseDetailScreen(
                          id: poseData.pose.id!,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      image: poseData.pose.thumbnail!,
                                      imageType: ImageType.pngNetwork,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PtdTextWidget.titleSmall(
                                        poseData.pose.name!,
                                        MaeumgagymColor.black,
                                      ),
                                      const SizedBox(height: 2),
                                      PtdTextWidget.bodySmall(
                                        "${poseData.repetitions}개 | ${poseData.sets}세트",
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
                        // SizedBox(height: index == .length - 1 ? 0 : 8),
                        SizedBox(
                            height: index ==
                                    ref
                                            .read(homeTodayRoutineController)
                                            .exerciseInfoResponseList!
                                            .length -
                                        1
                                ? 0
                                : 8),
                      ],
                    ),
                  );
                },
              );
            }, error: (err, _) {
              if (errState) {
                return Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: PtdTextWidget.bodyLarge(
                    '오늘의 루틴이 없어요',
                    MaeumgagymColor.gray400,
                  ),
                );
              } else {
                return Text(err.toString());
              }
            }, loading: () {
              return Center(
                child: CircularProgressIndicator(
                  color: MaeumgagymColor.blue500,
                ),
              );
            }),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
