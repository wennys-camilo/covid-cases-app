// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$casesCovidAtom = Atom(name: 'HomeStoreBase.casesCovid');

  @override
  CovidDataCases? get casesCovid {
    _$casesCovidAtom.reportRead();
    return super.casesCovid;
  }

  @override
  set casesCovid(CovidDataCases? value) {
    _$casesCovidAtom.reportWrite(value, super.casesCovid, () {
      super.casesCovid = value;
    });
  }

  final _$loadingAtom = Atom(name: 'HomeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$failureAtom = Atom(name: 'HomeStoreBase.failure');

  @override
  Option<Failure>? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Option<Failure>? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$fetchCasesAsyncAction = AsyncAction('HomeStoreBase.fetchCases');

  @override
  Future<void> fetchCases({String? url}) {
    return _$fetchCasesAsyncAction.run(() => super.fetchCases(url: url));
  }

  @override
  String toString() {
    return '''
casesCovid: ${casesCovid},
loading: ${loading},
failure: ${failure}
    ''';
  }
}
