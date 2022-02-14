import 'package:dot_messenger/models/user_model.dart';
import 'package:dot_messenger/services/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserComponent extends StatelessWidget {
  final Function(BuildContext context, UserModel) child;

  const UserComponent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) => child(
        context,
        (state as UserLoadedState).user,
      ),
    );
  }
}
