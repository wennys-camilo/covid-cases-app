import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/data/datasources/covid_cases_remote_datasource.dart';
import '../core/data/repositories/covid_cases_repository.dart';
import 'modules/home/home_module.dart';
import 'modules/home/home_store.dart';
import 'modules/login/login_module.dart';
import 'modules/login/login_store.dart';
import 'modules/signup/login_module.dart';
import 'modules/signup/signup_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => CovidCasesRemoteDatasourceImpl(i.get())),
    Bind((i) => CovidCasesImpl(i.get())),
    Bind((i) => LoginStore()),
    Bind((i) => SignUpStore()),
    Bind((i) => HomeStore(covidCasesRepository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute('/signup', module: SignUpModule()),
  ];
}
