import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

import '../../../cubit/cubit.dart';
import '../../../widget/widget.dart';

class OnboardingUsage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingUsage());

  const OnboardingUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Usage'),
            CustomButton(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              onPressed: () {
                context
                    .flow<OnboardingStatus>()
                    .update((state) => OnboardingStatus.complete);
              },
              child: const Text('Complete'),
            ),
          ],
        ),
      ),
    );
  }
}
