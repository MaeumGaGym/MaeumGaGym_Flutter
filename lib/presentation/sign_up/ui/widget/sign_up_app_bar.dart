import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import '../../../../component/image_widget.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 20.w),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
              child: ImageWidget(
                image: Images.arrowLeft,
                width: 24.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.h);
}