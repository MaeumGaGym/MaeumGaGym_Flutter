/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Widget
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/search/search_app_bar.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/search/search_body.dart';

import '../provider/pose_search_provider.dart';
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
      appBar: SearchAppbar(
        textEditingController: textController,
      ),
      body: SearchBody(
        textEditingController: textController,
        data: data,
      ),
    );
  }
}
