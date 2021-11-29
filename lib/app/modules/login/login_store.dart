import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import '../../../core/helpers/firebase_errors.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  bool loading = false;

  @action
  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required Function onFail,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    loading = true;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
    return user;
  }

  @action
  Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
