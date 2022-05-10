import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_transformation/src/cubit/login/login_cubit.dart';
import 'package:my_transformation/src/view/login/widgets/widgets.dart';
import 'package:my_transformation/src/widget/widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
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
            children: [
              const Logo(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 40.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        EmailInput(),
                        SizedBox(height: 15.0),
                        PasswordInput(),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: const [
                        LoginButton(),
                        SizedBox(height: 4.0),
                        SignUpButton()
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
