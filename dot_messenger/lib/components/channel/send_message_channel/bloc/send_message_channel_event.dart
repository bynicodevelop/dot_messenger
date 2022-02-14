part of 'send_message_channel_bloc.dart';

abstract class SendMessageChannelEvent extends Equatable {
  const SendMessageChannelEvent();

  @override
  List<Object> get props => [];
}

class OnSendMessageEvent extends SendMessageChannelEvent {
  final ChannelModel channelModel;
  final Map<String, dynamic> content;

  const OnSendMessageEvent({
    required this.channelModel,
    required this.content,
  });

  @override
  List<Object> get props => [
        channelModel,
        content,
      ];
}
