import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

class SelfCareTodayExerciseFAB extends StatelessWidget {
  const SelfCareTodayExerciseFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(), /// 둥글게
        backgroundColor: MaeumgagymColor.blue500,
        heroTag: "cameraButton", /// FAB 식별 태그
        child: SvgPicture.asset(
          "assets/image/self_care_icon/camera_icon.svg",
          color: MaeumgagymColor.white,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
