import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot_messenger/configs/custom_theme_data.dart';
import 'package:dot_messenger/configs/provider.dart';
import 'package:dot_messenger/firebase_options.dart';
import 'package:dot_messenger/screens/bootstrap_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    final String host = Platform.isAndroid ? "10.0.2.2" : "localhost";

    await FirebaseAuth.instance.useAuthEmulator(
      host,
      9099,
    );

    FirebaseFirestore.instance.useFirestoreEmulator(
      host,
      8080,
    );
  }

  await FirebaseFirestore.instance.terminate();
  await FirebaseFirestore.instance.clearPersistence();

  runApp(App(
    authentication: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ));
}

class App extends StatelessWidget {
  final FirebaseAuth authentication;
  final FirebaseFirestore firestore;

  const App({
    Key? key,
    required this.authentication,
    required this.firestore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      authentication: authentication,
      firestore: firestore,
      child: MaterialApp(
        title: 'Dot Messenger',
        theme: CustomThemeData.defaultTheme,
        debugShowCheckedModeBanner: false,
        home: const BootstrapScreen(),
      ),
    );
  }
}
