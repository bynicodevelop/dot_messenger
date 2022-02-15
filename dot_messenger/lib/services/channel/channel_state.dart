part of 'channel_bloc.dart';

abstract class ChannelState extends Equatable {
  const ChannelState();

  @override
  List<Object> get props => [];
}

class ChannelInitialState extends ChannelState {}

class ChannelLoadingState extends ChannelState {}

class ChannelLoadedState extends ChannelState {
  final ChannelModel channelModel;

  const ChannelLoadedState({
    required this.channelModel,
  });

  @override
  List<Object> get props => [
        channelModel,
      ];
}
