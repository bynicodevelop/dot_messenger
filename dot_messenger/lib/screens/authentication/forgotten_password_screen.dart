import 'package:dot_messenger/components/authentication/forgotten_form/forgotten_form_component.dart';
import 'package:dot_messenger/layouts/authentication_layout.dart';
import 'package:flutter/material.dart';

class ForgottenPasswordScreen extends StatelessWidget {
  const ForgottenPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationLayout(
        heading: Text(
          "Réinitialiser votre mot de passe",
          style: Theme.of(context).textTheme.headline1,
        ),
        form: Column(
          children: [
            const ForgottenFormComponent(),
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
