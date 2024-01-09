import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareProfileQuitDialog extends StatelessWidget {
  const SelfCareProfileQuitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: MaeumgagymColor.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PtdTextWidget.titleMedium(
                "회원탈퇴",
                MaeumgagymColor.black,
              ),
              const SizedBox(height: 8),
              PtdTextWidget.labelMedium(
                "정말 탈퇴하실건가요?\n30일 뒤에 활동이 모두 삭제돼요.",
                MaeumgagymColor.gray700,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.red50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: PtdTextWidget.labelLarge(
                          "취소",
                          MaeumgagymColor.red500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.red500,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: PtdTextWidget.labelLarge(
                          "탈퇴",
                          MaeumgagymColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
