/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Widget
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/search/pose_search_app_bar.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/search/pose_search_body.dart';

class PoseSearchScreen extends ConsumerStatefulWidget {
  const PoseSearchScreen({super.key});

  @override
  ConsumerState<PoseSearchScreen> createState() => _PoseSearchScreenState();
}

class _PoseSearchScreenState extends ConsumerState<PoseSearchScreen> {
  late TextEditingController textController;
  late FocusNode textFocusNode;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textFocusNode = FocusNode();

    textFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    textFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PoseSearchAppbar(
            textEditingController: textController,
            textFocusNode: textFocusNode,
          ),
          body: GestureDetector(
            onTap: () => textFocusNode.unfocus(),
            child: PoseSearchBody(
              textEditingController: textController,
            ),
          ),
        ),
      ),
    );
  }
}
