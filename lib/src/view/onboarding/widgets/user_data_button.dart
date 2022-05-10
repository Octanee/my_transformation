import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../cubit/cubit.dart';
import '../../../widget/widget.dart';

class UserDataButton extends StatelessWidget {
  const UserDataButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : CustomButton(
                key: const Key('onboarding_userDataButton'),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 5,
                ),
                color: theme.colorScheme.primary,
                isActive: state.status.isValidated,
                onPressed: () => context.flow<OnboardingStatus>().update(
                      (state) => OnboardingStatus.usage,
                    ),
                child: Text(
                  'Next',
                  style:
                      theme.textTheme.headline5!.copyWith(color: Colors.white),
                ),
              );
      },
    );
  }
}
