import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class PurposeAddEditTextField extends StatelessWidget {
  final String title, hintText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final double height;

  const PurposeAddEditTextField({
    super.key,
    required this.title,
    required this.focusNode,
    required this.controller,
    required this.hintText,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: pretendard,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: MaeumColor.black,
            overflow: TextOverflow.visible,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 1.sw - 40.w,
          height: height,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: focusNode.hasFocus
                ? MaeumColor.blue50
                : MaeumColor.gray25,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              width: 1.w,
              color: focusNode.hasFocus
                  ? MaeumColor.blue100
                  : MaeumColor.gray50,
            ),
          ),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            autofocus: false,
            onTap: () {
              if(focusNode.hasFocus){
                focusNode.unfocus();
              }
            },
            onTapOutside: (event) {
              focusNode.unfocus();
            },
            style: TextStyle(
              height: 20.sp / 20.sp,
              fontFamily: pretendard,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: MaeumColor.black,
              overflow: TextOverflow.visible,
            ),
            maxLines: 1000,
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: hintText,
              hintStyle: TextStyle(
                height: 20.sp / 20.sp,
                fontFamily: pretendard,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: MaeumColor.gray200,
                overflow: TextOverflow.visible,
              ),
            ),
            cursorHeight: 20.sp,
            cursorColor: MaeumColor.blue600,
          ),
        ),
      ],
    );
  }
}
