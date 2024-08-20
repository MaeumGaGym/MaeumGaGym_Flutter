import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class RoutineAddEditPoseItemCountWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FocusNode focusNode;

  const RoutineAddEditPoseItemCountWidget({
    super.key,
    required this.title,
    required this.controller,
    required this.focusNode,
  });

  void incrementControllerValue() {
    /// controller.text를 int로 변환할 수 있다면 변환 값을 반환, 아니면 null => 0,
    int currentValue = int.tryParse(controller.text) ?? 0;
    controller.text = (currentValue + 1).toString();
  }

  void decrementControllerValue() {
    int currentValue = int.tryParse(controller.text) ?? 0;

    /// 횟수가 최솟값인 1보다 작을 수 없기 때문.
    if (currentValue > 1) {
      controller.text = (currentValue - 1).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),

          /// 횟수 or 세트
          child: MaeumText.bodyMedium(title, MaeumColor.black),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Container(
            width: 1.sw,
            height: 36.h,
            decoration: BoxDecoration(
              color: MaeumColor.white,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: MaeumColor.gray100, width: 1.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => decrementControllerValue(),
                  child: Container(
                    width: 36.w,
                    decoration: BoxDecoration(
                      color: MaeumColor.gray25,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.r),
                        bottomLeft: Radius.circular(4.r),
                      ),
                      border: Border(
                        right: BorderSide(
                          color: MaeumColor.gray100,
                          width: 1.w,
                        ),
                      ),
                    ),
                    child: ImageWidget(
                      image: Images.editRemoveMinus,
                      color: MaeumColor.black,
                      imageHeight: 24.h,
                      imageWidth: 24.w,
                    ),
                  ),
                ),

                Expanded(
                  child: TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.done,
                    onTapOutside: (_) => focusNode.unfocus(),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        int parsedValue = int.tryParse(value) ?? 0;

                        /// 1보다 작은 경우 1로 설정
                        /// -, 0이 입력 되면 1로 고정
                        if (parsedValue < 1) {
                          controller.text = '1';
                        } else {}
                      }
                    },
                    textAlign: TextAlign.center,
                    cursorColor: MaeumColor.blue500,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: MaeumColor.black,
                      fontSize: 16.sp,
                      fontFamily: pretendard,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.visible,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => incrementControllerValue(),
                  child: Container(
                    width: 36.w,
                    decoration: BoxDecoration(
                      color: MaeumColor.gray25,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.r),
                        bottomRight: Radius.circular(4.r),
                      ),
                      border: Border(
                        left: BorderSide(
                          color: MaeumColor.gray100,
                          width: 1.w,
                        ),
                      ),
                    ),
                    child: ImageWidget(
                      image: Images.editAdd,
                      color: MaeumColor.black,
                      imageHeight: 24.h,
                      imageWidth: 24.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}