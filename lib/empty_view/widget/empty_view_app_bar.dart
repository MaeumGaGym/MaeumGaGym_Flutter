import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';

class EmptyViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyViewAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: MaeumgagymColor.white,
          title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: ImageWidget(
                image: Images.arrowLeft,
                width: 28,
                height: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
