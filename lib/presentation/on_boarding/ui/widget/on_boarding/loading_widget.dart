import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/maeum/maeum_color.dart';

class LoadingWidget extends StatelessWidget {
  final bool state;

  const LoadingWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (!state) {
          return const SizedBox();
        } else {
          return Opacity(
            opacity: 0.5,
            child: Container(
              width: 1.sw,
              height: 1.sh,
              color: MaeumColor.gray400,
              child: Center(
                child: CircularProgressIndicator(
                  color: MaeumColor.blue500,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
