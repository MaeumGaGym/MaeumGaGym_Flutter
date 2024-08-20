import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/presentation/profile/ui/view/profile_screen.dart';
import 'package:maeumgagym_flutter/presentation/profile/ui/widget/container/profile_container.dart';
import 'package:maeumgagym_flutter/presentation/self_care/ui/widget/self_care_divider.dart';
import 'package:maeumgagym_flutter/presentation/self_care/ui/widget/self_care_list_widget.dart';
import 'package:maeumgagym_flutter/presentation/self_care/ui/widget/self_care_title.dart';

class SelfCareScreen extends StatelessWidget {
  const SelfCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Self Care Title
          const SelfCareTitle(),

          const SelfCareDivider(),

          /// Profile Container
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => MaeumNavigator.push(context, const ProfileScreen()),
            child: const ProfileContainer(),
          ),

          const SelfCareDivider(),

          /// Self Care List Widget
          const SelfCareListWidget(),

          const SelfCareDivider(),
        ],
      ),
    );
  }
}
