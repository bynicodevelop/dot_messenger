part of 'leave_channel_bloc.dart';

abstract class LeaveChannelEvent extends Equatable {
  const LeaveChannelEvent();

  @override
  List<Object> get props => [];
}

class OnLeaveChannel extends LeaveChannelEvent {
  final ChannelModel channelModel;

  const OnLeaveChannel({
    required this.channelModel,
  });

  @override
  List<Object> get props => [
        channelModel,
      ];
}
