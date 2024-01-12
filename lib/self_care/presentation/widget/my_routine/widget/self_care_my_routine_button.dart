import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMyRoutineButton extends StatelessWidget {
  const SelfCareMyRoutineButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 58,
          decoration: BoxDecoration(
            color: MaeumgagymColor.blue500,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/image/self_care_icon/add_icon.svg",
                width: 24,
                height: 24,
                color: MaeumgagymColor.white,
              ),
              const SizedBox(width: 8),
              PtdTextWidget.labelLarge(
                "루틴 추가하기",
                MaeumgagymColor.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
