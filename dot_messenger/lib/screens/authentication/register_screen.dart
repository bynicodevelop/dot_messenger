import 'package:dot_messenger/components/authentication/register_form/register_form_component.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "Créer un compte",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const RegisterFormComponent(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Connexion".toLowerCase()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
