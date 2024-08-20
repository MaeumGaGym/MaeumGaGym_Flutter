import 'package:flutter/cupertino.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';

import '../widget/pose_main/pose_main_app_bar.dart';
import '../widget/pose_main/pose_main_body.dart';

/// Pose에 가장 기본이 되는 스크린
class PoseMainScreen extends StatefulWidget {
  const PoseMainScreen({super.key});

  @override
  State<PoseMainScreen> createState() => _PoseMainScreenState();
}

class _PoseMainScreenState extends State<PoseMainScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return <Widget>[
            /// TabAppBar
            PoseMainAppBar(innerBoxIsScrolled: innerBoxIsScrolled),
          ];
        },

        /// 자세(글씨)까지를 제외한 고정되는 Pose Contents들
        body: const PoseMainBody(),
      ),
    );
  }
}