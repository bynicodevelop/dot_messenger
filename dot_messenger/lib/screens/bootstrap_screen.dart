import 'package:dot_messenger/screens/authentication/login_screen.dart';
import 'package:dot_messenger/screens/home_screen.dart';
import 'package:dot_messenger/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BootstrapScreen extends StatelessWidget {
  const BootstrapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (!snapshot.hasData) {
              return const LoginScreen();
            } else {
              return const HomeScreen();
            }
          }

          return const SplashScreen();
        });
  }
}
