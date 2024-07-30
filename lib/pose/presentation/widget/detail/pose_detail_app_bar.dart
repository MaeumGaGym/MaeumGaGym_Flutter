/// Package
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/view/pose_add_routine_screen.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class PoseDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String routineName;
  final String poseSimpleName, poseExactName;
  final PoseDataModel poseData;

  const PoseDetailAppBar({
    super.key,
    required this.routineName,
    required this.poseSimpleName,
    required this.poseExactName,
    required this.poseData,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: MaeumgagymColor.white,
        surfaceTintColor: MaeumgagymColor.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// POP 버튼
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const ImageWidget(
                image: Images.arrowLeft,
                width: 28,
                height: 28,
              ),
            ),

            /// 루틴에 추가
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PoseAddRoutineScreen(
                        routineName: routineName,
                        poseSimpleName: poseSimpleName,
                        poseExactName: poseExactName,
                        poseData: poseData),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: MaeumgagymColor.blue50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Center(
                    child: PtdTextWidget.labelSmall(
                      '루틴에 추가',
                      MaeumgagymColor.blue500,
                      null,
                      null,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
