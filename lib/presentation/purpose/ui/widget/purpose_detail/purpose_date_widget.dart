import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose_date_format_func.dart';

class PurposeDateWidget extends StatelessWidget {
  final String title, date;

  const PurposeDateWidget({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// 세로 막대
        Container(
          width: 2.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: MaeumColor.blue500,
            borderRadius: BorderRadius.circular(1.r),
          ),
        ),
        SizedBox(width: 8.w),
        MaeumText.bodyMedium(
          title,
          MaeumColor.gray600,
        ),
        SizedBox(width: 20.w),
        MaeumText.bodyMedium(
          PurposeDateFormatFunc.formatDetailDate(date),
          MaeumColor.gray600,
        ),
      ],
    );
  }
}
