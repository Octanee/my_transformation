import 'package:flutter/material.dart';

class OnboardingComplete extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingComplete());

  const OnboardingComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Usage'),
      ),
    );
  }
}
