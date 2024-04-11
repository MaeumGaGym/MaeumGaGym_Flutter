import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_today_routines_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main/widget/home_main_container_title.dart';

class HomeMainRoutineContainer extends ConsumerWidget {
  const HomeMainRoutineContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(
      builder: (context) =>
          ref.watch(homeTodayRoutineController).statusCode.when(
        data: (data) {
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: HomeMainContainerTitle(title: "오늘의 루틴"),
                  ),
                  ListView.builder(
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
                      return Column(
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
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
        error: (err, _) {
          return Text(err.toString());
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(
              color: MaeumgagymColor.blue500,
            ),
          );
        },
      ),
    );
  }
}
