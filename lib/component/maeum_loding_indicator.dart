import 'package:flutter/material.dart';

import '../core/maeum/maeum_color.dart';

class MaeumLoadingIndicator extends StatelessWidget {
  const MaeumLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: MaeumColor.blue500,
      ),
    );
  }
}
