import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/core/di/login_option_di.dart';
import 'package:maeum_ga_gym_flutter/core/logout/presentation/maeumgagym_logout_provider.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/view/on_boarding_screen.dart';

class SelfCareProfileLogoutDialog extends ConsumerWidget {
  const SelfCareProfileLogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoutNotifier = ref.read(maeumgagymLogoutProvider.notifier);
    final loginOption = ref.watch(loginOptionController);
    ref.listen(maeumgagymLogoutProvider.select((value) => value),
        (previous, next) {
      if (next.stateus == const AsyncData(false)) {
        context.go('/onBoarding');
      }
    });
    return Dialog(
      /// AlertDialog 보다 크기 조절이 좋음
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

            /// Widget 아이템 길이만큼 Column 사이즈 지정
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PtdTextWidget.titleMedium(
                "로그아웃",
                MaeumgagymColor.black,
              ),
              const SizedBox(height: 8),
              PtdTextWidget.labelMedium(
                "로그아웃 하실건가요?",
                MaeumgagymColor.gray700,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
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
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    /// 구분선을 제외한 Row 사이즈의 반 만큼
                    child: GestureDetector(
                      onTap: () {
                        logoutNotifier.logout(loginOption: loginOption);
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: MaeumgagymColor.red500,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: PtdTextWidget.labelLarge(
                            "확인",
                            MaeumgagymColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
