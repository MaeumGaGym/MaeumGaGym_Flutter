import 'package:flutter/material.dart';

import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';

class TimerEmptyView extends StatelessWidget {
  const TimerEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaeumText.titleMedium("타이머 - 없음", MaeumColor.gray600),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaeumText.titleMedium("지금 ", MaeumColor.gray600),
              MaeumText.titleMedium("추가", MaeumColor.blue500),
              MaeumText.titleMedium("해보시겠어요?", MaeumColor.gray600),
            ],
          )
        ],
      ),
    );
  }
}
