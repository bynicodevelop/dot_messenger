import 'package:dot_messenger/components/authentication/login_form/bloc/login_form_bloc.dart';
import 'package:dot_messenger/components/forms/buttons/submit_button.dart';
import 'package:dot_messenger/components/forms/inputs/email_input.dart';
import 'package:dot_messenger/components/forms/inputs/password_input.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/screens/authentication/forgotten_password_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormComponent extends StatefulWidget {
  const LoginFormComponent({Key? key}) : super(key: key);

  @override
  State<LoginFormComponent> createState() => _LoginFormComponentState();
}

class _LoginFormComponentState extends State<LoginFormComponent> {
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
              content: Text(
                "Identiants incorrects",
              ),
              backgroundColor: kDangerColor,
            ),
          );
          return;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
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
                      builder: (context) => const ForgottenPasswordScreen(),
                    ),
                  ),
                  child: Text(
                    "Mot de passe oublié ?",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: kDefaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                  ),
                ),
              ],
            ),
            SubmitButton(
              label: "Se connecter".toUpperCase(),
              onPressed: (state is LoginLoadingState)
                  ? null
                  : () {
                      if (_emailController.text.isEmpty &&
                          _passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez remplir tous les champs"),
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
          ],
        );
      },
    );
  }
}
