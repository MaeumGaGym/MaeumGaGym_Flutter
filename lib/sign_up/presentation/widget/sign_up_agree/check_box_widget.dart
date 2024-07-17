import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool state;

  const CheckBoxWidget({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    if (state) {
      return ImageWidget(
        image: Images.iconsCheckCircle,
        imageType: ImageType.png,
        width: 28,
        height: 28,
        color: MaeumgagymColor.blue500,
      );
    } else {
      return ImageWidget(
        image: Images.iconsCheckCircleOutline,
        imageType: ImageType.png,
        width: 28,
        height: 28,
        color: MaeumgagymColor.gray200,
      );
    }
  }
}
