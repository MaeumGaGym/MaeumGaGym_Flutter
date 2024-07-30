import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/self_care_camera_screen.dart';

class SelfCareTodayExerciseFAB extends StatelessWidget {
  const SelfCareTodayExerciseFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SelfCareCameraScreen(),
          ),
        ),
        shape: const CircleBorder(),

        /// 둥글게
        backgroundColor: MaeumgagymColor.blue500,
        heroTag: "cameraButton",

        /// FAB 식별 태그
        child: ImageWidget(
          image: Images.iconsCamera,
          color: MaeumgagymColor.white,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
