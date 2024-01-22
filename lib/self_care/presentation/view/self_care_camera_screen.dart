import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// 카메라 정보 저장 ex 전면, 후면 카메라
late List<CameraDescription> cameras;

class SelfCareCameraScreen extends StatefulWidget {
  const SelfCareCameraScreen({super.key});

  @override
  State<SelfCareCameraScreen> createState() => _SelfCareCameraScreenState();
}

class _SelfCareCameraScreenState extends State<SelfCareCameraScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
