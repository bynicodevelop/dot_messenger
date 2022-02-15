part of 'channel_bloc.dart';

abstract class ChannelEvent extends Equatable {
  const ChannelEvent();

  @override
  List<Object> get props => [];
}

class OnChannelInitilizedEvent extends ChannelEvent {
  final String channelId;

  const OnChannelInitilizedEvent(
    this.channelId,
  );

  @override
  List<Object> get props => [
        channelId,
      ];
}

class OnChannelUpdatedEvent extends ChannelEvent {
  final ChannelModel channelModel;

  const OnChannelUpdatedEvent({
    required this.channelModel,
  });

  @override
  List<Object> get props => [
        channelModel,
      ];
}
