import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/cubit/cubit.dart';
import 'package:my_transformation/src/view/sign_up/sign_up_form.dart';

import '../../repository/repository.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const SignUpPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (_) => SignUpCubit(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: const SignUpForm(),
    );
  }
}
