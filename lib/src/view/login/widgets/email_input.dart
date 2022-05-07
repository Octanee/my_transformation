import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/widget/widget.dart';

import '../../../cubit/cubit.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomFormInput(
          key: const Key('loginForm_emailInput'),
          labelText: 'Email',
          prefixIcon: const Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
          error: state.email.invalid,
          onChanged: (email) =>
              context.read<LoginCubit>().emailChanged(value: email),
        );
      },
    );
  }
}
