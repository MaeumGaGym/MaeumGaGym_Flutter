import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/camera/self_care_camera_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

/// 카메라 정보 저장 ex 전면, 후면 카메라
late List<CameraDescription> cameras;

class SelfCareCameraScreen extends StatefulWidget {
  const SelfCareCameraScreen({super.key});

  @override
  State<SelfCareCameraScreen> createState() => _SelfCareCameraScreenState();
}

class _SelfCareCameraScreenState extends State<SelfCareCameraScreen> {
  late CameraController cameraController;

  @override
  void initState() {
    super.initState();

    /// 후면 카메라, 사전 해상도 max
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.black,
      appBar: SelfCareDefaultAppBar(
        iconPath: Images.editClose,
        title: "사진 촬영",
        backgroundColor: MaeumgagymColor.black,
        color: MaeumgagymColor.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                /// 카메라 미리보기
                child: CameraPreview(cameraController),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 72),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelfCareCameraWidget(iconPath: Images.iconsImage),
                  ImageWidget(
                    image: Images.iconsNotDesignSysCameraButtonIcon,
                    width: 80,
                  ),
                  SelfCareCameraWidget(iconPath: Images.iconsTurn),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
