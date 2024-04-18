import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/presentation/maeumgagym_re_issue_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_today_routines_provider.dart';

import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class HomeTodayRoutineButton extends ConsumerWidget {
  final bool isCompleted;

  const HomeTodayRoutineButton({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        if (!ref.watch(homeTodayRoutineController).statusCode.isLoading) {
          await ref
              .read(homeTodayRoutineController.notifier)
              .completeTodayRoutines();

          if (ref.watch(homeTodayRoutineController).statusCode.hasError) {
            String? refreshToken =
                await TokenSecureStorageDi.readLoginRefreshToken();

            await ref
                .read(maeumgagymReIssueController.notifier)
                .getReIssue(refreshToken!);

            await ref
                .read(homeTodayRoutineController.notifier)
                .completeTodayRoutines();
          }

          await ref
              .read(homeTodayRoutineController.notifier)
              .getTodayRoutines();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 98,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MaeumgagymColor.white,
          border: Border.all(color: MaeumgagymColor.gray50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: isCompleted
                  ? MaeumgagymColor.blue50
                  : MaeumgagymColor.blue500,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: PtdTextWidget.bodyLarge(
                isCompleted ? '루틴 완료 취소하기' : '루틴 완료하기',
                isCompleted ? MaeumgagymColor.blue500 : MaeumgagymColor.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
