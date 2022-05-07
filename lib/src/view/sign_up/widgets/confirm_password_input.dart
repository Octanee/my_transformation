import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../widget/widget.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return CustomFormInput(
          key: const Key('signUpForm_confirmPasswordInput'),
          labelText: 'Confirmed password',
          obscureText: true,
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          suffixIcon: IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              // TODO Hide/Show password
            },
          ),
          error: state.confirmedPassword.invalid,
          onChanged: (confirmedPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(value: confirmedPassword),
        );
      },
    );
  }
}
