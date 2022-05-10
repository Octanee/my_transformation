import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../widget/widget.dart';

class NameInput extends StatelessWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      // buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return CustomFormInput(
            key: const Key('signUpForm_nameInput'),
            labelText: 'Name',
            prefixIcon: const Icon(Icons.person_outline_rounded),
            keyboardType: TextInputType.name,
            //error: state.name.invalid,
            onChanged: (name) => {}
            // context.read<SignUpCubit>().nameChanged(value: name),
            );
      },
    );
  }
}
