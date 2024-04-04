import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';

import '../../../core/di/login_option_di.dart';
import '../../../core/di/token_secure_storage_di.dart';
import '../provider/maeumgagym_re_issue_provider.dart';

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
          .getReIssue(refreshToken, loginOption);

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
          data: (data) {
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
