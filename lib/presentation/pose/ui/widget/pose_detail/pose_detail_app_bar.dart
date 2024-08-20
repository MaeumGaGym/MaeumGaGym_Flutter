import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/view/add_to_routine_screen.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class PoseDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PoseDetailEntity poseData;

  const PoseDetailAppBar({
    super.key,
    required this.poseData,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// POP 버튼
              GestureDetector(
                onTap: () => MaeumNavigator.pop(context),
                child: ImageWidget(
                  image: Images.arrowLeft,
                  width: 28.w,
                  height: 28.h,
                ),
              ),

              /// 루틴에 추가
              GestureDetector(
                onTap: () => MaeumNavigator.push(context, AddToRoutineScreen(poseData: poseData)),
                child: Container(
                  decoration: BoxDecoration(
                    color: MaeumColor.blue50,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    child: Center(
                      child: MaeumText.labelSmall(
                        '루틴에 추가',
                        MaeumColor.blue500,
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
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
