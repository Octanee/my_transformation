import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/bloc/bloc.dart';
import 'package:my_transformation/src/view/home/widgets/widgets.dart';
import 'package:my_transformation/src/widget/widget.dart';

class HomePage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: HomePage());

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
            onPressed: () => context.read<AuthBloc>().add(
                  LogoutRequested(),
                ),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const HomeView(),
    );
  }
}
