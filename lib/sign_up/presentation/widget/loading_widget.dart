import 'package:flutter/material.dart';

import '../../../config/maeumgagym_color.dart';

class LoadingWidget extends StatelessWidget {
  final bool state;

  const LoadingWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (state) {
          return const SizedBox();
        } else {
          return Opacity(
            opacity: 0.5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: MaeumgagymColor.gray400,
              child: Center(
                child: CircularProgressIndicator(
                  color: MaeumgagymColor.blue500,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
