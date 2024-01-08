import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMainProfileContainer extends StatelessWidget {
  const SelfCareMainProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MaeumgagymColor.black,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PtdTextWidget.labelLarge(
                        "김현석",
                        MaeumgagymColor.black,
                      ),
                      SizedBox(width: 8),
                      SvgPicture.asset(
                        "assets/image/self_care_icon/profile_icon.svg",
                        height: 16,
                        width: 16,
                      )
                    ],
                  ),
                  PtdTextWidget.bodyMedium(
                    "124시간",
                    MaeumgagymColor.gray400,
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/image/core_icon/right_arrow_icon.svg",
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
