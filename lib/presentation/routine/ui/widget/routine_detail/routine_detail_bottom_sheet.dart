import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/component/maeum_button.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_detail/routine_detail_manager_dialog.dart';

class RoutineDetailBottomSheet extends StatelessWidget {
  final RoutineEntity routineData;

  const RoutineDetailBottomSheet({super.key, required this.routineData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: MaeumColor.gray50))
      ),
      child: Row(
        children: [
          MaeumButton(
            width: 1.sw - 92.w,
            color: MaeumColor.blue500,
            borderRadius: 8.r,
            leading: ImageWidget(image: Images.mediaPlayFilled, color: MaeumColor.white, width: 24.w),
            text: "루틴 시작하기",
            fontColor: MaeumColor.white,
          ),
          SizedBox(width: 20.w),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return RoutineDetailManagerDialog(
                    routineData: routineData,
                  );
                },
              );
            },
            child: ImageWidget(image: Images.iconsDotsVertical, width: 32.w),
          )
        ],
      ),
    );
  }
}
