import 'package:flutter/material.dart';

class OnboardingUserData extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingUserData());

  const OnboardingUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('User Data'),
      ),
    );
  }
}
