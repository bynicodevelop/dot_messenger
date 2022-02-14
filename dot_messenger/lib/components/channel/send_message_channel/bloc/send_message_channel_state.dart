part of 'send_message_channel_bloc.dart';

abstract class SendMessageChannelState extends Equatable {
  const SendMessageChannelState();

  @override
  List<Object> get props => [];
}

class SendMessageInitialState extends SendMessageChannelState {}

class SendMessageLoadingState extends SendMessageChannelState {}

class SendMessageSuccessState extends SendMessageChannelState {}

class SendMessageFailureState extends SendMessageChannelState {
  final String error;

  const SendMessageFailureState(this.error);

  @override
  List<Object> get props => [
        error,
      ];
}
