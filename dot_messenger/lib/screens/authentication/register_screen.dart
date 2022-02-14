import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("register"),
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
