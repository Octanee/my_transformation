import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../widget/widget.dart';

class AgeInput extends StatelessWidget {
  const AgeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) => previous.age != current.age,
      builder: (context, state) {
        return CustomFormInput(
          key: const Key('onboarding_ageInput'),
          labelText: 'Age',
          prefixIcon: const Icon(Icons.person_outline_rounded),
          keyboardType: TextInputType.number,
          error: state.age.invalid,
          onChanged: (age) {
            final value = age.isEmpty ? 1 : double.parse(age).toInt();
            context.read<OnboardingCubit>().ageChanged(value: value);
          },
        );
      },
    );
  }
}
