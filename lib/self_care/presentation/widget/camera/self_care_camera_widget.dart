import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';

class SelfCareCameraWidget extends StatelessWidget {
  final String iconPath;

  const SelfCareCameraWidget({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: MaeumgagymColor.gray800,
        borderRadius: BorderRadius.circular(34),
      ),
      child: ImageWidget(
        image: iconPath,
        width: 24,
        color: MaeumgagymColor.white,
      ),
    );
  }
}
