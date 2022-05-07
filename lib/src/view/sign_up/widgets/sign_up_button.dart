import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../cubit/cubit.dart';
import '../../../widget/widget.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : CustomButton(
                key: const Key('signUpForm_signUpButton'),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 5,
                ),
                color: theme.colorScheme.primary,
                isActive: state.status.isValidated,
                onPressed: () async {
                  final value = await context.read<SignUpCubit>().signUp();
                  if (value) Navigator.of(context).pop();
                },
                child: Text(
                  'SIGN UP',
                  style:
                      theme.textTheme.headline5!.copyWith(color: Colors.white),
                ),
              );
      },
    );
  }
}
