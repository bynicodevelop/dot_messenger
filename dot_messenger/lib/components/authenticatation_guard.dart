import 'package:dot_messenger/components/authentication/logout_button/bloc/logout_bloc.dart';
import 'package:dot_messenger/screens/bootstrap_screen.dart';
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
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const BootstrapScreen(),
            ),
            (route) => false,
          );
        }
      },
      child: child,
    );
  }
}
