import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/data/datasources/covid_cases_remote_datasource.dart';
import '../../../core/data/repositories/covid_cases_repository.dart';
import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CovidCasesRemoteDatasourceImpl(i.get())),
    Bind((i) => CovidCasesImpl(i.get())),
    Bind((i) => HomeStore(covidCasesRepository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
