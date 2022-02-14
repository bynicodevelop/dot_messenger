import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot_messenger/components/channel/create_channel/bloc/create_channel_bloc.dart';
import 'package:dot_messenger/components/channel/delete_channel/bloc/delete_channel_bloc.dart';
import 'package:dot_messenger/components/channel/leave_channel/bloc/leave_channel_bloc.dart';
import 'package:dot_messenger/components/channel/list_channel/bloc/list_channel_bloc.dart';
import 'package:dot_messenger/components/channel/list_channel_messages/bloc/list_channel_message_bloc.dart';
import 'package:dot_messenger/components/channel/send_message_channel/bloc/send_message_channel_bloc.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:dot_messenger/repositories/channel_message_repository.dart';
import 'package:dot_messenger/repositories/channel_repository.dart';
import 'package:dot_messenger/services/login/login_bloc.dart';
import 'package:dot_messenger/services/user/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Provider extends StatelessWidget {
  final Widget child;
  final FirebaseAuth authentication;
  final FirebaseFirestore firestore;

  const Provider({
    Key? key,
    required this.child,
    required this.authentication,
    required this.firestore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChannelRepository channelRepository = ChannelRepository(
      firestore: firestore,
      authentication: authentication,
    );

    final ChannelMessageRepository channelMessageRepository =
        ChannelMessageRepository(
      firestore: firestore,
      authentication: authentication,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          lazy: false,
          create: (context) => UserBloc(
            authenticationRepository: AuthenticationRepository(
              authentication: authentication,
            ),
          ),
        ),
        BlocProvider<LoginBloc>(
          lazy: false,
          create: (context) => LoginBloc(
            authenticationRepository: AuthenticationRepository(
              authentication: authentication,
            ),
          ),
        ),
        BlocProvider<CreateChannelBloc>(
          create: (context) => CreateChannelBloc(
            channelRepository: channelRepository,
          ),
        ),
        BlocProvider(
          create: (context) => ListChannelBloc(
            channelRepository: channelRepository,
          ),
        ),
        BlocProvider(
          create: (context) => DeleteChannelBloc(
            channelRepository: channelRepository,
          ),
        ),
        BlocProvider(
          create: (context) => LeaveChannelBloc(
            channelRepository: channelRepository,
          ),
        ),
        BlocProvider(
          create: (context) => ListChannelMessageBloc(
            channelMessageRepository: channelMessageRepository,
          ),
        ),
        BlocProvider(
          create: (context) => SendMessageChannelBloc(
            channelMessageRepository: channelMessageRepository,
          ),
        ),
      ],
      child: child,
    );
  }
}
