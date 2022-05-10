import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/bloc/database/database_bloc.dart';
import 'package:my_transformation/src/config/app_routes.dart';

class LoadingFlow extends StatelessWidget {
  const LoadingFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<bool>(
      state: context.select((DatabaseBloc bloc) => bloc.state.userData.isNew),
      onGeneratePages: onGenerateNewUserFlow,
    );
  }
}
