import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/helpers/validators.dart';
import '../../../core/ui/themes/app_colors.dart';
import '../../../core/ui/themes/app_images.dart';
import '../../../core/ui/themes/app_text_styles.dart';
import '../../../core/ui/widgets/rounded_button_widget.dart';
import '../../../core/ui/widgets/rounded_input_widget.dart';
import 'login_store.dart';
import 'widgets/no_account_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Modular.to.navigate('/home');
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                    ),
                    child: Observer(
                      builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Casos de Covid',
                                style: AppTextStyles.loginTitle,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Center(
                                child: SvgPicture.asset(AppImages.covid,
                                    height: MediaQuery.of(context).size.height *
                                        0.35)),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  RoundedInputWidget(
                                    hintText: 'E-mail',
                                    iconData: Icons.email,
                                    controller: _emailTextController,
                                    focusNode: _focusEmail,
                                    validator: (value) =>
                                        Validator.validateEmail(
                                      email: value,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  RoundedInputWidget(
                                    hintText: 'Senha',
                                    iconData: Icons.lock,
                                    controller: _passwordTextController,
                                    focusNode: _focusPassword,
                                    obscureText: true,
                                    validator: (value) =>
                                        Validator.validatePassword(
                                      password: value,
                                    ),
                                  ),
                                  store.loading
                                      ? const CircularProgressIndicator()
                                      : RoundedButtonWidget(
                                          text: 'Entrar',
                                          color: AppColors.blue,
                                          press: () async {
                                            _focusEmail.unfocus();
                                            _focusPassword.unfocus();

                                            if (_formKey.currentState!
                                                .validate()) {
                                              User? user = await store
                                                  .signInUsingEmailPassword(
                                                email:
                                                    _emailTextController.text,
                                                password:
                                                    _passwordTextController
                                                        .text,
                                                onFail: (e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          "Falha ao Entrar: $e"),
                                                      backgroundColor:
                                                          AppColors.red,
                                                    ),
                                                  );
                                                },
                                              );

                                              if (user != null) {
                                                Modular.to.navigate('/home');
                                              }
                                            }
                                          },
                                          child: Text(
                                            'Entrar',
                                            style: TextStyle(
                                                color: AppColors.white),
                                          ),
                                        ),
                                  NoAcconuntWidget(
                                    press: () {
                                      Modular.to.navigate('/signup');
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(
                color: AppColors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}
