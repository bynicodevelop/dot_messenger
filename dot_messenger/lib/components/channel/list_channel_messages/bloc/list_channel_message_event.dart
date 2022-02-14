part of 'list_channel_message_bloc.dart';

abstract class ListChannelMessageEvent extends Equatable {
  const ListChannelMessageEvent();

  @override
  List<Object> get props => [];
}

class OnListChannelMessageEvent extends ListChannelMessageEvent {
  final ChannelModel channelModel;

  const OnListChannelMessageEvent({
    required this.channelModel,
  });

  @override
  List<Object> get props => [
        channelModel,
      ];
}

class _OnListChannelMessageState extends ListChannelMessageEvent {
  final List<MessageModel> messages;

  const _OnListChannelMessageState({
    required this.messages,
  });

  @override
  List<Object> get props => [
        messages,
      ];
}
