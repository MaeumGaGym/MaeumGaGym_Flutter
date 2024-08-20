import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool state;

  const CheckBoxWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if(state){
          return ImageWidget(
            image: Images.iconsCheckCircle,
            color: MaeumColor.blue500,
            width: 28.w,
          );
        } else {
          return ImageWidget(
            image: Images.iconsCheckCircleOutline,
            color: MaeumColor.gray200,
            width: 28.w,
          );
        }
      },
    );
  }
}
