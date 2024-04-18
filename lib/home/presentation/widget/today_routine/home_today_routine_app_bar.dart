import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';

import '../../../../config/maeumgagym_color.dart';

class HomeTodayRoutineAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeTodayRoutineAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: MaeumgagymColor.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: ImageWidget(
                  image: "assets/image/core_icon/left_arrow_icon.svg",
                  imageType: ImageType.svg,
                  width: 28,
                  height: 28,
                  color: MaeumgagymColor.black,
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
