part of 'list_channel_message_bloc.dart';

abstract class ListChannelMessageState extends Equatable {
  const ListChannelMessageState();

  @override
  List<Object> get props => [];
}

class ListChannelMessageInitialState extends ListChannelMessageState {}

class ListChannelMessageLoadingState extends ListChannelMessageState {}

class ListChannelMessageLoadedState extends ListChannelMessageState {
  final List<MessageModel> messages;

  const ListChannelMessageLoadedState({
    required this.messages,
  });

  @override
  List<Object> get props => [
        messages,
      ];
}
