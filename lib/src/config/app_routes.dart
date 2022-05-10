import 'package:flutter/material.dart';
import 'package:my_transformation/src/bloc/bloc.dart';
import 'package:my_transformation/src/view/view.dart';

import '../cubit/cubit.dart';

List<Page> onGenerateAuthFlow(
  AuthStatus status,
  List<Page<dynamic>> pages,
) {
  switch (status) {
    case AuthStatus.authenticated:
      return [LoadingPage.page()];
    case AuthStatus.unauthenticated:
      return [LoginPage.page()];
  }
}

List<Page> onGenerateNewUserFlow(
  bool isNew,
  List<Page<dynamic>> pages,
) {
  if (isNew) {
    return [OnboardingPage.page()];
  }
  return [HomePage.page()];
}

List<Page> onGenerateOnboardingFlow(
  OnboardingStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case OnboardingStatus.welcomeComplete:
      return [];
    case OnboardingStatus.userDataComplete:
      return [];
    case OnboardingStatus.usageComplete:
      return [];
    case OnboardingStatus.initial:
    default:
      return [];
  }
}
