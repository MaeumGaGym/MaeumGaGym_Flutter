import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

class SelfCareDefaultAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final String iconPath;

  const SelfCareDefaultAppBar({
    Key? key,
    this.title,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: MaeumgagymColor.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    iconPath,
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
