import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';

import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class PoseAddRoutineDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String routineName;

  const PoseAddRoutineDetailAppBar({Key? key, required this.routineName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: MaeumgagymColor.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const ImageWidget(
                  image: Images.arrowLeft,
                  imageWidth: 28,
                  imageHeight: 28,
                ),
              ),
              const SizedBox(width: 24),
              PtdTextWidget.labelLarge(routineName, MaeumgagymColor.black),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
