import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/login/login_store.dart';
import 'modules/signup/signup_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute('/signup', module: SignUpModule()),
  ];
}
