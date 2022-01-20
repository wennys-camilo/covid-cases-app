import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import '../../../core/helpers/firebase_errors.dart';
part 'signup_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  @observable
  bool loading = false;

  @action
  Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required Function onFail,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    loading = true;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    } catch (e) {
      rethrow;
    }
    loading = false;
    return user;
  }
}
