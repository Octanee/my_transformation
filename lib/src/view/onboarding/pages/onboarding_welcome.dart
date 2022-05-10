import 'package:flutter/material.dart';

class OnboardingWelcome extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingWelcome());

  const OnboardingWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
