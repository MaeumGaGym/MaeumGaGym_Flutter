import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/metronome/home_metronome_setting_screen.dart';

class HomeMetronomeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeMetronomeAppBar({super.key});

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
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/image/core_icon/left_arrow_icon.svg",
                  width: 32,
                  height: 32,
                  color: MaeumgagymColor.black,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeMetronomeSettingScreen(),
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/image/core_icon/dots_vertical_icon.svg",
                  width: 32,
                  height: 32,
                  color: MaeumgagymColor.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
