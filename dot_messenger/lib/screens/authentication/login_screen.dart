import 'package:dot_messenger/components/authentication/login_form/login_form_component.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/layouts/authentication_layout.dart';
import 'package:dot_messenger/screens/authentication/register_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
        ),
        child: AuthenticationLayout(
          heading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: kDefaultPadding / 2,
                ),
                child: Text(
                  "Connexion",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Ou",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey[800],
                      ),
                  children: [
                    TextSpan(
                      text: " créer un compte",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: kDefautColor,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            ),
                      // ,
                    ),
                  ],
                ),
              )
            ],
          ),
          form: const LoginFormComponent(),
        ),
      ),
    );
  }
}
