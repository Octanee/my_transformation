import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:my_transformation/src/cubit/cubit.dart';
import 'package:my_transformation/src/widget/custom_button.dart';

class OnboardingWelcome extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingWelcome());

  const OnboardingWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Welcome'),
            CustomButton(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              onPressed: () {
                context
                    .flow<OnboardingStatus>()
                    .update((state) => OnboardingStatus.userData);
              },
              child: const Text('User data'),
            ),
          ],
        ),
      ),
    );
  }
}
