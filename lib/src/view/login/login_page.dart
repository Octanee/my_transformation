import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/cubit/login/login_cubit.dart';
import 'package:my_transformation/src/view/login/widgets/widgets.dart';

import '../../repository/repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: const LoginForm(),
    );
  }
}
