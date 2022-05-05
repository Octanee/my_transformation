import 'package:flutter/cupertino.dart';
import 'package:my_transformation/src/bloc/bloc.dart';
import 'package:my_transformation/src/view/view.dart';

List<Page> onGenerateAppPages(AppStatus status, List<Page<dynamic>> pages) {
  switch (status) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
