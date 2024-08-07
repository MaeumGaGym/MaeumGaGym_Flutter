import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/model/exercise_info_edit_routine_pose_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_pose_list_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/widget/routine_my_routine_item_count_widget.dart';

class SelfCareMyRoutinePoseItemWidget extends ConsumerStatefulWidget {
  final int? listIndex;
  final int poseIndex;

  const SelfCareMyRoutinePoseItemWidget({
    Key? key,
    this.listIndex,
    required this.poseIndex,
  }) : super(key: key);

  @override
  ConsumerState<SelfCareMyRoutinePoseItemWidget> createState() =>
      _SelfCareMyRoutinePoseItemWidgetState();
}

class _SelfCareMyRoutinePoseItemWidgetState
    extends ConsumerState<SelfCareMyRoutinePoseItemWidget> {
  @override
  Widget build(BuildContext context) {
    List<ExerciseInfoEditRoutinePoseModel> editPoseListState =
        ref.watch(selfCareMyRoutinePostListProvider);
    final editPoseListNotifier =
        ref.read(selfCareMyRoutinePostListProvider.notifier);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                /// 아이템 사진
                ClipOval(
                  child: ImageWidget(
                    width: 80,
                    height: 80,
                    imageType: ImageType.pngNetwork,
                    image: editPoseListState[widget.poseIndex]
                        .poseModel!
                        .thumbnail
                        .toString(),
                    backgroundColor: MaeumgagymColor.gray25,
                  ),
                ),
                const SizedBox(width: 18),

                /// 아이템 이름
                PtdTextWidget.bodyLarge(
                  editPoseListState[widget.poseIndex]
                      .poseModel!
                      .name
                      .toString(),
                  MaeumgagymColor.black,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                editPoseListNotifier.delete(widget.poseIndex);
                // if (editPoseListState.length != 1) {
                //   /// 포즈는 최소 한개 남아있어야함.
                //
                // }
              },
              child: ImageWidget(
                image: Images.editClose,
                imageWidth: 24,
                imageHeight: 24,
                color: MaeumgagymColor.gray700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        RoutineMyRoutineItemCountWidget(
          title: "횟수",
          controller: editPoseListState[widget.poseIndex].repetitionsController,
        ),
        const SizedBox(height: 12),
        RoutineMyRoutineItemCountWidget(
          title: "세트",
          controller: editPoseListState[widget.poseIndex].setsController,
        ),
      ],
    );
  }
}
