import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/bloc/bloc.dart';
import 'package:my_transformation/src/repository/repository.dart';

import 'app_view.dart';

class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;

  const App({
    required AuthenticationRepository authenticationRepository,
    Key? key,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (context) =>
            AuthBloc(authenticationRepository: _authenticationRepository),
        child: const AppView(),
      ),
    );
  }
}
