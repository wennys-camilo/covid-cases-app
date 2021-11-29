import 'package:flutter_modular/flutter_modular.dart';

import 'signup_page.dart';

class SignUpModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SignUpPage()),
  ];
}
