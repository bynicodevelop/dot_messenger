part of 'leave_channel_bloc.dart';

abstract class LeaveChannelState extends Equatable {
  const LeaveChannelState();

  @override
  List<Object> get props => [];
}

class LeaveChannelInitialState extends LeaveChannelState {}

class LeaveChannelLoadingState extends LeaveChannelState {}

class LeaveChannelSuccessState extends LeaveChannelState {}

class LeaveChannelFailureState extends LeaveChannelState {
  final String error;

  const LeaveChannelFailureState(
    this.error,
  );

  @override
  List<Object> get props => [
        error,
      ];
}
