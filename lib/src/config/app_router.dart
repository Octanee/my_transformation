import 'package:flutter/cupertino.dart';
import 'package:my_transformation/src/view/view.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return ErrorScreen.route();
    }
  }
}
