import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/pose_tab_state_cubit.dart';

import '../../../../../../../core/images.dart';
import '../../../../../../image_widget.dart';

class PoseRecommendWidgetTop extends StatelessWidget {
  final String titleText;

  const PoseRecommendWidgetTop({
    super.key,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 맨몸 운동 글씨
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: MaeumText.titleMedium(
                "$titleText 운동",
                MaeumColor.black,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => context.read<PoseTabStateCubit>().changeStateToName(titleText),
          child: Row(
            children: [
              MaeumText.bodyMedium('더보기', MaeumColor.gray400),
              SizedBox(width: 8.w),
              ImageWidget(
                image: Images.chevronRight,
                width: 24.w,
                height: 24.h,
                color: MaeumColor.gray200,
              ),
            ],
          ),
        ),
      ],
    );
  }
}