import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_transformation/src/cubit/cubit.dart';
import 'package:my_transformation/src/view/sign_up/widgets/widgets.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            EmailInput(),
            SizedBox(height: 10.0),
            PasswordInput(),
            SizedBox(height: 10.0),
            ConfirmPasswordInput(),
            SizedBox(height: 100.0),
            SignUpButton()
          ],
        ),
      ),
    );
  }
}
