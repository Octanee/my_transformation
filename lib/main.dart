import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_transformation/src/config/config.dart';
import 'package:my_transformation/src/repository/authentication.dart';
import 'package:my_transformation/src/view/view.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);

      
      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;

      runApp(App(authenticationRepository: authenticationRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}
