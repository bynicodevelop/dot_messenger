import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot_messenger/components/authentication/login_form/bloc/login_form_bloc.dart';
import 'package:dot_messenger/components/authentication/logout_button/bloc/logout_bloc.dart';
import 'package:dot_messenger/components/authentication/register_form/bloc/register_form_bloc.dart';
import 'package:dot_messenger/components/channel/create_channel/bloc/create_channel_bloc.dart';
import 'package:dot_messenger/components/channel/delete_channel/bloc/delete_channel_bloc.dart';
import 'package:dot_messenger/components/channel/leave_channel/bloc/leave_channel_bloc.dart';
import 'package:dot_messenger/components/channel/list_channel/bloc/list_channel_bloc.dart';
import 'package:dot_messenger/components/channel/list_channel_messages/bloc/list_channel_message_bloc.dart';
import 'package:dot_messenger/components/channel/send_message_channel/bloc/send_message_channel_bloc.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:dot_messenger/repositories/channel_message_repository.dart';
import 'package:dot_messenger/repositories/channel_repository.dart';
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
    final AuthenticationRepository authenticationRepository =
        AuthenticationRepository(
      authentication: authentication,
    );

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
            authenticationRepository: authenticationRepository,
          ),
        ),
        BlocProvider<LoginBloc>(
          lazy: false,
          create: (context) => LoginBloc(
            authenticationRepository: authenticationRepository,
          ),
        ),
        BlocProvider<RegisterFormBloc>(
          create: (context) => RegisterFormBloc(
            authenticationRepository: authenticationRepository,
          ),
        ),
        BlocProvider<LogoutBloc>(
          create: (context) => LogoutBloc(
            authenticationRepository: authenticationRepository,
          ),
        ),
        BlocProvider<CreateChannelBloc>(
          create: (context) => CreateChannelBloc(
            channelRepository: channelRepository,
          ),
        ),
        BlocProvider<ListChannelBloc>(
          create: (context) => ListChannelBloc(
            channelRepository: channelRepository,
          ),
        ),
        BlocProvider<DeleteChannelBloc>(
          create: (context) => DeleteChannelBloc(
            channelRepository: channelRepository,
          ),
        ),
        BlocProvider<LeaveChannelBloc>(
          create: (context) => LeaveChannelBloc(
            channelRepository: channelRepository,
          ),
        ),
        BlocProvider<ListChannelMessageBloc>(
          create: (context) => ListChannelMessageBloc(
            channelMessageRepository: channelMessageRepository,
          ),
        ),
        BlocProvider<SendMessageChannelBloc>(
          create: (context) => SendMessageChannelBloc(
            channelMessageRepository: channelMessageRepository,
          ),
        ),
        // BlocProvider(
        //   create: (context) => GoogleConnectBloc(
        //     authenticationRepository: authenticationRepository,
        //   ),
        // ),
        // BlocProvider(
        //   create: (context) => FacebookConnectBloc(
        //     authenticationRepository: authenticationRepository,
        //   ),
        // ),
      ],
      child: child,
    );
  }
}
