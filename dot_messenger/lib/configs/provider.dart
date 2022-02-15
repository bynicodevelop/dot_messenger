import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot_messenger/components/authentication/forgotten_form/bloc/forgotten_form_bloc.dart';
import 'package:dot_messenger/components/authentication/login_form/bloc/login_form_bloc.dart';
import 'package:dot_messenger/components/authentication/logout_button/bloc/logout_bloc.dart';
import 'package:dot_messenger/components/authentication/register_form/bloc/register_form_bloc.dart';
import 'package:dot_messenger/components/channel/channel_editing_action/bloc/channel_editing_action_bloc.dart';
import 'package:dot_messenger/components/channel/channel_settings/bloc/channel_setting_bloc.dart';
import 'package:dot_messenger/components/channel/create_channel/bloc/create_channel_bloc.dart';
import 'package:dot_messenger/components/channel/delete_channel/bloc/delete_channel_bloc.dart';
import 'package:dot_messenger/components/channel/leave_channel/bloc/leave_channel_bloc.dart';
import 'package:dot_messenger/components/channel/list_channel/bloc/list_channel_bloc.dart';
import 'package:dot_messenger/components/channel/list_channel_messages/bloc/list_channel_message_bloc.dart';
import 'package:dot_messenger/components/channel/send_message_channel/bloc/send_message_channel_bloc.dart';
import 'package:dot_messenger/components/profile_avatar/bloc/upload_file_bloc.dart';
import 'package:dot_messenger/repositories/authentication_respository.dart';
import 'package:dot_messenger/repositories/channel_message_repository.dart';
import 'package:dot_messenger/repositories/channel_repository.dart';
import 'package:dot_messenger/repositories/storage_repository.dart';
import 'package:dot_messenger/services/channel/channel_bloc.dart';
import 'package:dot_messenger/services/user/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Provider extends StatelessWidget {
  final Widget child;
  final FirebaseAuth authentication;
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  const Provider({
    Key? key,
    required this.child,
    required this.authentication,
    required this.firestore,
    required this.storage,
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

    final StorageRepository storageRepository = StorageRepository(
      authentication: authentication,
      storage: storage,
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
        BlocProvider<ForgottenFormBloc>(
          create: (context) => ForgottenFormBloc(
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
        BlocProvider<ChannelEditingActionBloc>(
          create: (context) => ChannelEditingActionBloc(),
        ),
        BlocProvider<UploadfileBloc>(
          create: (context) => UploadfileBloc(
            storageRepository: storageRepository,
            channelMessageRepository: channelMessageRepository,
          ),
        ),
        BlocProvider<ChannelSettingBloc>(
          create: (context) => ChannelSettingBloc(
            channelRepository: channelRepository,
          ),
        ),
        BlocProvider<ChannelBloc>(
          lazy: false,
          create: (context) => ChannelBloc(
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
