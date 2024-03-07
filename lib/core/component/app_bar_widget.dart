import 'package:flutter/material.dart';

import '../../config/maeumgagym_color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final List<Widget> children;
  final MainAxisAlignment alignment;

  const AppBarWidget({
    super.key,
    required this.height,
    required this.children,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: MaeumgagymColor.white,
        surfaceTintColor: MaeumgagymColor.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: alignment,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
