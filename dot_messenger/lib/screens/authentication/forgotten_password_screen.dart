import 'package:flutter/material.dart';

class ForgottenPasswordScreen extends StatelessWidget {
  const ForgottenPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("ForgottenPasswordScreen"),
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
    );
  }
}
