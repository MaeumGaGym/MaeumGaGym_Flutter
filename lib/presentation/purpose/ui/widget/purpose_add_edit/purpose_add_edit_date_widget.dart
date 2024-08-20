import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';
import '../../../view_model/purpose_add_edit/purpose_calender_model.dart';

class PurposeAddEditDateWidget extends StatelessWidget {
  final String title;
  final PurposeCalenderModel state;

  const PurposeAddEditDateWidget({
    super.key,
    required this.title,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: state.calenderLayerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaeumText.bodyMedium(
            title,
            state.isActive ? MaeumColor.blue500 : MaeumColor.black,
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(12.w),
            width: 1.sw - 40.w,
            decoration: BoxDecoration(
              color: state.isActive ? MaeumColor.blue50 : MaeumColor.gray25,
              border: Border.all(
                color: state.isActive ? MaeumColor.blue100 : MaeumColor.gray50,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: MaeumText.bodyLarge(
              "${state.date.year}년 ${state.date.month}월 ${state.date.day}일",
              MaeumColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
