import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../widget/widget.dart';

class OnboardingComplete extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingComplete());

  const OnboardingComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Complete'),
            CustomButton(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              onPressed: () {
                context.read<OnboardingCubit>().completeOnboarding();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
