// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStoreBase, Store {
  final _$loadingAtom = Atom(name: '_SignUpStoreBase.loading');

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

  final _$registerUsingEmailPasswordAsyncAction =
      AsyncAction('_SignUpStoreBase.registerUsingEmailPassword');

  @override
  Future<User?> registerUsingEmailPassword(
      {required String name,
      required String email,
      required String password,
      required Function onFail}) {
    return _$registerUsingEmailPasswordAsyncAction.run(() => super
        .registerUsingEmailPassword(
            name: name, email: email, password: password, onFail: onFail));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
