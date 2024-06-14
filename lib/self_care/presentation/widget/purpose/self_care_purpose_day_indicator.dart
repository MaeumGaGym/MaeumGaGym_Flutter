import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeungagym_text_style.dart';

class SelfCarePurposeDayIndicator extends StatefulWidget {
  final FocusNode focusNode;
  final FocusNode otherFocusNode;
  final String title;

  const SelfCarePurposeDayIndicator({
    super.key,
    required this.title,
    required this.focusNode,
    required this.otherFocusNode,
  });

  @override
  State<SelfCarePurposeDayIndicator> createState() =>
      _SelfCarePurposeDayIndicatorState();
}

class _SelfCarePurposeDayIndicatorState extends State<SelfCarePurposeDayIndicator> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: MaeumGaGymTextStyle.bodyMedium(
            widget.focusNode.hasFocus
                ? MaeumgagymColor.blue500
                : MaeumgagymColor.black,
          ),
        ),
        const SizedBox(height: 8),
        Focus(
          focusNode: widget.focusNode,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (!widget.otherFocusNode.hasFocus) {
                  print("실행");
                  widget.focusNode.hasFocus ? widget.focusNode.unfocus() : widget.focusNode.requestFocus();
                } else {
                  print('해제');
                  widget.otherFocusNode.unfocus();
                }
              });
            },
            child: Container(
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
            ),
          ),
        ),
      ],
    );
  }
}
