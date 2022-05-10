import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/config/config.dart';
import 'package:my_transformation/src/cubit/cubit.dart';
import 'package:my_transformation/src/repository/repository.dart';

class OnboardingPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingPage());

  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(
        databaseRepository: context.read<DatabaseRepository>(),
      ),
      child: const FlowBuilder<OnboardingStatus>(
        state: OnboardingStatus.welcome,
        onGeneratePages: onGenerateOnboardingFlow,
      ),
    );
  }
}
