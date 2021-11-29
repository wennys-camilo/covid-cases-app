// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$loadingAtom = Atom(name: '_LoginStoreBase.loading');

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

  final _$signInUsingEmailPasswordAsyncAction =
      AsyncAction('_LoginStoreBase.signInUsingEmailPassword');

  @override
  Future<User?> signInUsingEmailPassword(
      {required String email,
      required String password,
      required Function onFail}) {
    return _$signInUsingEmailPasswordAsyncAction.run(() => super
        .signInUsingEmailPassword(
            email: email, password: password, onFail: onFail));
  }

  final _$refreshUserAsyncAction = AsyncAction('_LoginStoreBase.refreshUser');

  @override
  Future<User?> refreshUser(User user) {
    return _$refreshUserAsyncAction.run(() => super.refreshUser(user));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
