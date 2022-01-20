import 'package:covid_cases_app/app/modules/signup/signup_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'signup_page.dart';

class SignUpModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SignUpStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SignUpPage()),
  ];
}
