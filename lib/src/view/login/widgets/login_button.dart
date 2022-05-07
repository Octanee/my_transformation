import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_transformation/src/widget/widget.dart';

import '../../../cubit/cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : CustomButton(
                key: const Key('loginForm_loginButton'),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 5,
                ),
                color: theme.colorScheme.primary,
                isActive: state.status.isValidated,
                onPressed: () => context.read<LoginCubit>().logIn(),
                child: Text(
                  'LOGIN',
                  style:
                      theme.textTheme.headline5!.copyWith(color: Colors.white),
                ),
              );
      },
    );
  }
}
