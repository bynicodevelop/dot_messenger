part of 'delete_channel_bloc.dart';

abstract class DeleteChannelState extends Equatable {
  const DeleteChannelState();

  @override
  List<Object> get props => [];
}

class DeleteChannelInitialState extends DeleteChannelState {}

class DeleteChannelLoadingState extends DeleteChannelState {}

class DeleteChannelSuccessState extends DeleteChannelState {}

class DeleteChannelFailureState extends DeleteChannelState {
  final String error;

  const DeleteChannelFailureState(this.error);

  @override
  List<Object> get props => [error];
}
