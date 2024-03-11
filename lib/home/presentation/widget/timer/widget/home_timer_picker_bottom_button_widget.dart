import 'package:flutter/material.dart';

import '../../../../../config/maeumgagym_color.dart';
import '../../../../../core/component/text/pretendard/ptd_text_widget.dart';

class HomeTimerPickerBottomButtonWidget extends StatelessWidget {
  final String title;

  const HomeTimerPickerBottomButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 30,
      alignment: Alignment.center,
      child: PtdTextWidget.labelLarge(
        title,
        MaeumgagymColor.black,
      ),
    );
  }
}
