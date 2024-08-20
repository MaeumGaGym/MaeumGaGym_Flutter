import 'package:flutter/material.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/widget/pose_search/pose_search_app_bar.dart';

import '../widget/pose_search/pose_search_body.dart';

class PoseSearchScreen extends StatefulWidget {
  const PoseSearchScreen({super.key});

  @override
  State<PoseSearchScreen> createState() => _PoseSearchScreenState();
}

class _PoseSearchScreenState extends State<PoseSearchScreen> {
  late TextEditingController searchController;
  late FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchFocusNode = FocusNode();

    searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: PoseSearchAppBar(
        searchController: searchController,
        searchFocusNode: searchFocusNode,
      ),
      body: GestureDetector(
        onTap: () => searchFocusNode.unfocus(),
        child: const PoseSearchBody(),
      ),
    );
  }
}