import 'package:dot_messenger/screens/home_screen.dart';
import 'package:dot_messenger/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dot Messenger',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
