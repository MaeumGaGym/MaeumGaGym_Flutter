import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareTodayExerciseGalleryAlbumWidget extends StatelessWidget {
  const SelfCareTodayExerciseGalleryAlbumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 126,
            height: 126,
            decoration: BoxDecoration(
              color: MaeumgagymColor.blue100,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 4),
          PtdTextWidget.titleSmall(
            "히히",
            MaeumgagymColor.black,
          ),
          PtdTextWidget.bodyTiny(
            "123일간의 기록",
            MaeumgagymColor.gray400,
          ),
        ],
      ),
    );
  }
}
