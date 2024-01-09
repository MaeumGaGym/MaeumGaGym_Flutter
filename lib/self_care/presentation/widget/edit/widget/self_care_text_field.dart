import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareTextField extends StatefulWidget {
  final String title;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String? suffixText;

  const SelfCareTextField({
    super.key,
    required this.title,
    required this.focusNode,
    required this.controller,
    this.suffixText,
  });

  @override
  State<SelfCareTextField> createState() => _SelfCareTextFieldState();
}

class _SelfCareTextFieldState extends State<SelfCareTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PtdTextWidget.bodyMedium(
          widget.title,
          MaeumgagymColor.black,
        ),
        const SizedBox(height: 8),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          decoration: BoxDecoration(
            color: widget.focusNode.hasFocus
                ? MaeumgagymColor.blue50
                : MaeumgagymColor.gray25,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: widget.focusNode.hasFocus
                  ? MaeumgagymColor.blue100
                  : MaeumgagymColor.gray50,
            ),
          ),
          child: Center(
            child: TextFormField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              style: TextStyle(
                color: MaeumgagymColor.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Pretendard",
                overflow: TextOverflow.visible,
                decorationThickness: 0,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                suffixText: widget.suffixText,
                suffixStyle: TextStyle(
                  color: MaeumgagymColor.gray600,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Pretendard",
                  overflow: TextOverflow.visible,
                  decorationThickness: 0,
                ),
              ),
              cursorColor: MaeumgagymColor.blue600,
            ),
          ),
        ),
      ],
    );
  }
}
