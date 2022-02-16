import 'package:dot_messenger/components/authentication/register_form/register_form_component.dart';
import 'package:dot_messenger/layouts/authentication_layout.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationLayout(
        heading: Text(
          "Créer un compte",
          style: Theme.of(context).textTheme.headline1,
        ),
        form: Column(
          children: [
            const RegisterFormComponent(),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Connexion".toUpperCase(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      letterSpacing: .8,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
