/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Screen
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/tab/tab_app_bar.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/tab/tab_contents.dart';

class PoseTabScreen extends ConsumerStatefulWidget {
  const PoseTabScreen({super.key});

  @override
  ConsumerState<PoseTabScreen> createState() => _PoseTabScreenState();
}

class _PoseTabScreenState extends ConsumerState<PoseTabScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              /// TabAppBar
              TabAppBar(innerBoxIsScrolled: innerBoxIsScrolled),
            ];
          },

          /// TabContents
          body: const TabContents(),
        ),
      ),
    );
  }
}
