/// Package
import 'package:flutter/material.dart';

/// Core

import 'package:maeum_ga_gym_flutter/pose/presentation/widget/detail/detail_app_bar.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/detail/detail_body.dart';

class PoseDetailScreen extends StatefulWidget {
  final List<String> poseImages, exerciseWay, caution;
  final String simpleName, exactName, simplePart, exactPart;

  const PoseDetailScreen({
    required this.poseImages,
    required this.simpleName,
    required this.exactName,
    required this.simplePart,
    required this.exactPart,
    required this.exerciseWay,
    required this.caution,
    super.key,
  });

  @override
  State<PoseDetailScreen> createState() => _PoseDetailScreenState();
}

class _PoseDetailScreenState extends State<PoseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> image = widget.poseImages;
    final String simpleName = widget.simpleName;
    final String exactName = widget.exactName;
    final String simplePart = widget.simplePart;
    final String exactPart = widget.exactPart;
    final List<String> exerciseWay = widget.exerciseWay;
    final List<String> caution = widget.caution;

    final List<String> pikleList = [
      'assets/image/pose_icon/pickle1.png',
      'assets/image/pose_icon/pickle2.png',
      'assets/image/pose_icon/pickle3.png',
      'assets/image/pose_icon/pickle4.png',
    ];

    return Scaffold(
      appBar: const DetailAppBar(),
      body: SafeArea(
        child: DetailBody(
          image: image,
          simpleName: simpleName,
          exactName: exactName,
          simplePart: simplePart,
          exactPart: exactPart,
          exerciseWay: exerciseWay,
          caution: caution,
          pikleList: pikleList,
        ),
      ),
    );
  }
}
