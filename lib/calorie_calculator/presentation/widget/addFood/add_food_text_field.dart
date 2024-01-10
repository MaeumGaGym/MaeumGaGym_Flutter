import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class AddFoodTextField extends StatefulWidget {
  final TextEditingController textController;

  const AddFoodTextField({super.key, required this.textController});

  @override
  State<AddFoodTextField> createState() => _AddFoodTextFieldState();
}

class _AddFoodTextFieldState extends State<AddFoodTextField> {
  @override
  Widget build(BuildContext context) {
    final num mediaWidth = MediaQuery.of(context).size.width;
    final TextEditingController textController = widget.textController;

    return Container(
      width: mediaWidth - 40,
      height: 40,
      decoration: BoxDecoration(
        color: MaeumgagymColor.gray50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/image/core_icon/search_icon.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: mediaWidth - 96,
              child: TextField(
                controller: textController,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                cursorHeight: 15,
                cursorColor: MaeumgagymColor.blue500,
                style: TextStyle(
                  fontFamily: pretendard,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 7),
                  hintText: '음식 검색',
                  hintStyle: TextStyle(
                    fontFamily: pretendard,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: MaeumgagymColor.gray300,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
