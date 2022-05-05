import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_transformation/src/bloc/bloc.dart';

import '../../../cubit/cubit.dart';

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
            : ElevatedButton(
                key: const Key('signUpForm_signUpButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: theme.primaryColor,
                ),
                onPressed: state.status.isValidated
                    ? () async {
                        var value = await context.read<SignUpCubit>().signUp();
                        if (value) Navigator.of(context).pop();
                      }
                    : null,
                child: Text(
                  'SIGN UP',
                  style: theme.textTheme.headline5,
                ),
              );
      },
    );
  }
}
