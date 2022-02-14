import 'package:dot_messenger/components/authenticatation_guard.dart';
import 'package:dot_messenger/components/authentication/logout_button/logout_button_component.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticationGuard(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: const Center(
          child: LogoutButtonComponent(),
        ),
      ),
    );
  }
}
