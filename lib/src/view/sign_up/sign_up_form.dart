import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_transformation/src/cubit/cubit.dart';
import 'package:my_transformation/src/view/sign_up/widgets/widgets.dart';
import 'package:my_transformation/src/widget/widget.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        height: 150,
        child: Text(
          'Sign Up',
          style: theme.textTheme.headline4!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
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
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:50.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  EmailInput(),
                  SizedBox(height: 20.0),
                  PasswordInput(),
                  SizedBox(height: 20.0),
                  ConfirmPasswordInput(),
                  SizedBox(height: 50),
                  SignUpButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
