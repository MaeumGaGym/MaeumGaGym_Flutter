/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/provider/pose_all_provider.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/provider/pose_detail_provider.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/provider/pose_search_provider.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Screen
import '../../view/pose_detail_screen.dart';

class PoseSearchBody extends ConsumerWidget {
  final TextEditingController textEditingController;

  const PoseSearchBody({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poseSearchState = ref.watch(poseSearchController);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 4),

          /// 검색된 List들
          Expanded(
            child: ListView.builder(
              itemCount: ref.read(poseAllController).length,
              itemBuilder: (BuildContext context, int index) {
                final poseAll = ref.read(poseAllController);

                final bool searchCondition =
                    !(([poseAll[index].name!] + poseAll[index].simplePart)
                        .toString()
                        .contains(poseSearchState));

                /// 만약 textField에 값에 이름이 들어가지 않는다면 SizedBox.shrink
                if (poseSearchState.isNotEmpty && searchCondition) {
                  return const SizedBox.shrink();
                } else {
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PoseDetailScreen(
                            id: poseAll[index].id!,
                          ),
                        ),
                      );

                      ref.read(poseDetailController.notifier).setDetailData();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// Pose Image
                          ImageWidget(
                            image: poseAll[index].thumbnail!,
                            imageType: ImageType.pngNetwork,
                            backgroundColor: MaeumgagymColor.gray50,
                            radiusCircular: 8,
                            width: 64,
                            height: 64,
                          ),

                          /// Contents
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 122,
                              height: 48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// SimpleName
                                  PtdTextWidget.bodyMedium(
                                    poseAll[index].name!,
                                    MaeumgagymColor.black,
                                  ),

                                  /// ExactPart
                                  PtdTextWidget.bodyMedium(
                                    poseAll[index]
                                        .simplePart
                                        .toString()
                                        .substring(
                                            1,
                                            poseAll[index]
                                                    .simplePart
                                                    .toString()
                                                    .length -
                                                1),
                                    MaeumgagymColor.gray400,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
