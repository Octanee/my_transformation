import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../widget/widget.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomFormInput(
          key: const Key('loginForm_passwordInput'),
          labelText: 'Password',
          obscureText: true,
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          suffixIcon: IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              // TODO Hide/Show password
            },
          ),
          error: state.password.invalid,
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(value: password),
        );
      },
    );
  }
}
