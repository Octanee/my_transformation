import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/bloc/bloc.dart';
import 'package:my_transformation/src/bloc/database/database_bloc.dart';
import 'package:my_transformation/src/repository/repository.dart';
import 'package:my_transformation/src/view/loading/widgets/widgets.dart';
import 'package:my_transformation/src/widget/circle_background.dart';

class LoadingPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: LoadingPage());

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final databaseRepository = DatabaseRepository(
      id: context.select((AuthBloc bloc) => bloc.state.user.id),
    );
    return RepositoryProvider.value(
      value: databaseRepository,
      child: BlocProvider(
        create: (context) => DatabaseBloc(
          databaseRepository: databaseRepository,
        ),
        child: const LoadingFlow(),
      ),
    );
  }
}
