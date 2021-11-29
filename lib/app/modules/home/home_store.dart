import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import '../../../core/data/models/covid_datacases.dart';
import '../../../core/data/repositories/covid_cases_repository.dart';
import '../../../core/helpers/failure.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final CovidCasesRepository covidCasesRepository;

  @observable
  CovidDataCases? casesCovid;

  @observable
  bool loading = false;

  @observable
  Option<Failure>? failure;

  HomeStoreBase({required this.covidCasesRepository}) {
    fetchCasesInitial();
  }

  @action
  Future<void> fetchCasesInitial() async {
    loading = true;
    failure = none();
    final response = await covidCasesRepository.getCases();

    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      loading = false;
    }, (sucessResult) {
      loading = false;
      casesCovid = sucessResult;
    });
  }

  @action
  Future<void> fetchNextOrPrevious(String url) async {
    loading = true;
    failure = none();
    final response = await covidCasesRepository.getNextPrevious(url);

    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      loading = false;
    }, (sucessResult) {
      loading = false;
      casesCovid = sucessResult;
    });
  }
}
