import 'package:dot_messenger/components/authenticatation_guard.dart';
import 'package:dot_messenger/services/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: Center(
          child: ElevatedButton(
            onPressed: () => context.read<LoginBloc>().add(
                  OnLogoutEvent(),
                ),
            child: const Text("Déconnexion"),
          ),
        ),
      ),
    );
  }
}
