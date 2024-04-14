import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/provider/pose_all_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/provider/pose_recommend_provider.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/provider/social_login_provider.dart';

import '../../../core/di/login_option_di.dart';
import '../../../core/di/token_secure_storage_di.dart';
import '../../../core/re_issue/presentation/maeumgagym_re_issue_provider.dart';
import '../../../home/presentation/providers/home_quotes_provider.dart';
import '../../../home/presentation/providers/home_today_routines_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late AsyncValue<int?> getRefreshTokenState;

  Future<AsyncValue<int?>> getRefreshToken(LoginOption loginOption) async {
    String? refreshToken = await TokenSecureStorageDi.readLoginRefreshToken();

    if (refreshToken != null) {
      await ref
          .read(maeumgagymReIssueController.notifier)
          .getReIssue(refreshToken);

      return ref.watch(maeumgagymReIssueController).stateus;
    } else {
      return const AsyncError('null', StackTrace.empty);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getRefreshToken(LoginOption.google).then((value) {
        value.when(
          data: (data) async {
            await ref.read(homeQuotesController.notifier).getQuotes();

            await ref
                .read(homeTodayRoutineController.notifier)
                .getTodayRoutines();

            await ref
                .read(poseAllController.notifier)
                .getPoseDataList(lastUpdated: "2022-12-15T09:00");

            await ref.read(poseRecommendController.notifier).getRecommendPose();

            context.go('/home');
          },
          error: (err, _) {
            context.go('/onBoarding');
          },
          loading: () {},
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove(); //지워줘야 다음 화면이 보임
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      body: const Center(
        child: ImageWidget(
          imageType: ImageType.svg,
          image: 'assets/image/on_boarding_icon/splash_text_icon.svg',
        ),
      ),
    );
  }
}
