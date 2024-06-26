/// Package
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Screen
import 'package:maeum_ga_gym_flutter/sign_up/presentation/view/sign_up_agree_screen.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/view/sign_up_nick_name_screen.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/view/splash_screen.dart';
import '../sign_up/presentation/view/on_boarding_screen.dart';
import '../page_manager/presentation/view/page_manager_screen.dart';
import '../sign_up/presentation/view/sign_up_success_screen.dart';

CustomTransitionPage pageAnimation(Widget page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: '/signUpAgree',
      pageBuilder: (context, state) => pageAnimation(
        const SignUpAgreeScreen(),
      ),
    ),
    GoRoute(
      path: '/signUpNickName',
      pageBuilder: (context, state) => pageAnimation(
        const SignUpNickNameScreen(),
      ),
    ),
    GoRoute(
      path: '/signUpSuccess',
      pageBuilder: (context, state) => pageAnimation(
        const SignUpSuccessScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => pageAnimation(
        const PageManagerScreen(),
      ),
    ),
  ],
  observers: [
    DatadogNavigationObserver(datadogSdk: DatadogSdk.instance),
  ],
);
