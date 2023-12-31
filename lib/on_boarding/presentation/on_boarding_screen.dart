import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => context.push('/signUpAgree'),
        child: const Center(
          child: Text('sign up'),
        ),
      ),
    );
  }
}
