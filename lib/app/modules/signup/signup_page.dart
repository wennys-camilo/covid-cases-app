import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/helpers/validators.dart';
import '../../../core/ui/themes/app_colors.dart';
import '../../../core/ui/themes/app_text_styles.dart';
import '../../../core/ui/widgets/rounded_button_widget.dart';
import '../../../core/ui/widgets/rounded_input_widget.dart';
import 'signup_store.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpStore> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _focusName.dispose();
    _focusEmail.dispose();
    _focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(child: Observer(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Vamos Começar!",
                        style: AppTextStyles.mediumText,
                      ),
                      Text(
                        "Faça o cadastro para continuar",
                        style: AppTextStyles.greyText,
                      ),
                      const SizedBox(height: 50),
                      RoundedInputWidget(
                        iconData: Icons.person,
                        hintText: "Name",
                        controller: _nameTextController,
                        focusNode: _focusName,
                        validator: (value) => Validator.validateName(
                          name: value,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      RoundedInputWidget(
                        iconData: Icons.email,
                        hintText: "Email",
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      RoundedInputWidget(
                        iconData: Icons.lock,
                        hintText: "Password",
                        controller: _passwordTextController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) => Validator.validatePassword(
                          password: value,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Modular.to.navigate("/");
                          },
                          child: Text(
                            "Voltar",
                            style: AppTextStyles.textButtonBluekUnderline,
                          )),
                      store.loading
                          ? const CircularProgressIndicator()
                          : RoundedButtonWidget(
                              color: AppColors.blue,
                              text: "Sign up",
                              press: () async {
                                if (_registerFormKey.currentState!.validate()) {
                                  User? user =
                                      await store.registerUsingEmailPassword(
                                    name: _nameTextController.text,
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text,
                                    onFail: (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Falha ao Entrar: $e"),
                                            backgroundColor: Colors.red),
                                      );
                                    },
                                  );

                                  if (user != null) {
                                    Modular.to.navigate("/home");
                                  }
                                }
                              },
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    ],
                  ),
                )
              ],
            );
          })),
        ),
      ),
    );
  }
}
