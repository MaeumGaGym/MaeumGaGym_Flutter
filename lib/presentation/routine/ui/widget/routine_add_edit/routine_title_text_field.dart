import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class RoutineTitleTextField extends StatelessWidget {
  final TextEditingController routineTitleController;
  final FocusNode routineFocusNode;

  const RoutineTitleTextField({
    super.key,
    required this.routineTitleController,
    required this.routineFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaeumText.bodyMedium("제목", MaeumColor.black),
        SizedBox(height: 8.h),
        Container(
          width: 1.sw - 40.w,
          height: 48.h,
          padding: EdgeInsets.only(left: 12.w),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: MaeumColor.gray25,
            border: Border.all(color: MaeumColor.gray50, width: 1.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: TextField(
            controller: routineTitleController,
            focusNode: routineFocusNode,
            onTapOutside: (_) => routineFocusNode.unfocus(),
            cursorHeight: 20.sp,
            cursorColor: MaeumColor.blue500,
            style: TextStyle(
              height: 20.sp / 20.sp,
              fontFamily: pretendard,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: MaeumColor.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              border: InputBorder.none,
              hintText: "제목을 입력해주세요.",
              hintStyle: TextStyle(
                fontFamily: pretendard,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: MaeumColor.gray400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
