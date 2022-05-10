import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../widget/widget.dart';
import '../widgets/widgets.dart';

class OnboardingUserData extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: OnboardingUserData());

  const OnboardingUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        height: 150,
        child: Text(
          'Enter data',
          style: theme.textTheme.headline4!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                NameInput(),
                SizedBox(height: 20.0),
                AgeInput(),
                SizedBox(height: 50),
                UserDataButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
