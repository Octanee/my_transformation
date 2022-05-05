import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/bloc/bloc.dart';

class HomePage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: HomePage());

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => context.read<AppBloc>().add(
                  AppLogoutRequested(),
                ),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Column(
      children: [
        Text(
          user.email ?? '',
          style: textTheme.headline4,
        ),
        const SizedBox(height: 10),
        Text(
          user.name ?? '',
          style: textTheme.headline2,
        ),
      ],
    );
  }
}
