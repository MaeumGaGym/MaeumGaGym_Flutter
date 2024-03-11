import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareProfileMainInfoWidgetContainer extends StatelessWidget {
  const SelfCareProfileMainInfoWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // 이거 디자인 확정안됬다고 해서 나중에 다시 추가함
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: MaeumgagymColor.gray50,
            width: 2,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MaeumgagymColor.gray50,
              MaeumgagymColor.gray50.withOpacity(0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  "assets/image/self_care_icon/sparkling_icon.png",
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(height: 12),
              PtdTextWidget.titleMedium(
                "마음 뱃지",
                MaeumgagymColor.black,
              ),
              const SizedBox(height: 6),
              /// 나중에 폰트 설정 리팩토링 할 거기 때문에 이렇게 구현했습니다.
              PtdTextWidget.bodyMedium(
                "총 124시간 운동하셨어요!",
                MaeumgagymColor.gray600,
              ),
              const SizedBox(height: 7),
            ],
          ),
        ),
      ),
    );
  }
}
