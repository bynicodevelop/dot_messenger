import 'package:dot_messenger/screens/bootstrap_screen.dart';
import 'package:dot_messenger/services/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationGuard extends StatelessWidget {
  final Widget child;

  const AuthenticationGuard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const BootstrapScreen(),
            ),
          );
        }
      },
      child: child,
    );
  }
}
