import 'package:dot_messenger/components/forms/buttons/submit_button.dart';
import 'package:dot_messenger/components/forms/inputs/email_input.dart';
import 'package:dot_messenger/components/forms/inputs/password_input.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/screens/authentication/forgotten_password_screen.dart';
import 'package:dot_messenger/screens/authentication/register_screen.dart';
import 'package:dot_messenger/services/login/login_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      _emailController.text = "john@domain.tld";
      _passwordController.text = "123456";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          return;
        }

        if (state is LoginFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Indentifiants incorrects"),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Connexion",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Row(
                      children: [
                        const Text("Ou"),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          ),
                          child: const Text("Créer un compte"),
                        ),
                      ],
                    ),
                    EmailInput(
                      controller: _emailController,
                    ),
                    PasswordInput(
                      controller: _passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgottenPasswordScreen(),
                            ),
                          ),
                          child: const Text("Mot de passe oublié ?"),
                        ),
                      ],
                    ),
                    SubmitButton(
                      label: "Se connecter",
                      onPressed: (state is LoginLoadingState)
                          ? null
                          : () {
                              if (_emailController.text.isEmpty &&
                                  _passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Veuillez remplir tous les champs"),
                                  ),
                                );

                                return null;
                              }

                              context.read<LoginBloc>().add(
                                    OnLoginWithEmailPasswordEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: kDefaultPadding / 2,
                        bottom: kDefaultPadding,
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2,
                            ),
                            child: Text(
                              "Ou continuer avec",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.grey[700],
                                  ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: kDefaultPadding * 2,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: kDefaultPadding / 3),
                                    child: FaIcon(
                                      FontAwesomeIcons.facebook,
                                      size: kDefaultPadding,
                                    ),
                                  ),
                                  Text("Facebook"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: kDefaultPadding / 2,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: kDefaultPadding * 2,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: kDefaultPadding / 3,
                                    ),
                                    child: FaIcon(
                                      FontAwesomeIcons.google,
                                      size: kDefaultPadding,
                                    ),
                                  ),
                                  Text("Google"),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
