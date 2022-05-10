import 'package:flutter/material.dart';

class OnboardingUsage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingUsage());

  const OnboardingUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Usage'),
      ),
    );
  }
}
