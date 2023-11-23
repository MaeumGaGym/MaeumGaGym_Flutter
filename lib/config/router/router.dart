import 'package:go_router/go_router.dart';

import 'package:wewith_flutter/presentation/on_boarding_screen/on_boarding_screen.dart';
import 'package:wewith_flutter/presentation/signup_screen/signup_agree_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, state) => const OnBoardingScreen(),
      routes: [
        GoRoute(
          path: 'signupAgree',
          builder: (_, state) => const SignUpAgreeScreen(),
        ),
      ],
    ),
  ],
);
