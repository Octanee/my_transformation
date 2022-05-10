import 'package:flutter/material.dart';

import '../../widget/widget.dart';

class OnboardingPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingPage());

  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Onboarding',
          style: textTheme.headline4,
        ),
      ],
    );
  }
}
