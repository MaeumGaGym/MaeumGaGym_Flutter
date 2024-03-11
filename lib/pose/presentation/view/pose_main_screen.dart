/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Screen
import '../widget/main/pose_main_app_bar.dart';
import '../widget/main/pose_main_contents.dart';

/// Pose에 가장 기본이 되는 스크린
class PoseMainScreen extends ConsumerStatefulWidget {
  const PoseMainScreen({super.key});

  @override
  ConsumerState<PoseMainScreen> createState() => _PoseMainScreenState();
}

class _PoseMainScreenState extends ConsumerState<PoseMainScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        /// 위 AppBar를 움직일 수 있도록 만든 위젯
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              /// TabAppBar
              PoseMainTabAppBar(innerBoxIsScrolled: innerBoxIsScrolled),
            ];
          },

          /// 자세(글씨)까지를 제외한 고정되는 Pose Contents들
          body: const PoseMainTabContents(),
        ),
      ),
    );
  }
}
