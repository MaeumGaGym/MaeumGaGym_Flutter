/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Widget
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/search/pose_search_app_bar.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/search/pose_search_body.dart';

import '../widget/pose_data.dart';

class PoseSearchScreen extends ConsumerStatefulWidget {
  const PoseSearchScreen({super.key});

  @override
  ConsumerState<PoseSearchScreen> createState() => _PoseSearchScreenState();
}

class _PoseSearchScreenState extends ConsumerState<PoseSearchScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoseSearchAppbar(
        textEditingController: textController,
      ),
      body: PoseSearchBody(
        textEditingController: textController,
        data: data,
      ),
    );
  }
}
