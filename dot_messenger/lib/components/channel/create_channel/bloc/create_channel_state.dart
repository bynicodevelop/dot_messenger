part of 'create_channel_bloc.dart';

abstract class CreateChannelState extends Equatable {
  const CreateChannelState();

  @override
  List<Object> get props => [];
}

class CreateChannelInitialState extends CreateChannelState {}

class CreateChannelLoadingState extends CreateChannelState {}

class CreateChannelSuccessState extends CreateChannelState {
  final ChannelModel canal;

  const CreateChannelSuccessState({
    required this.canal,
  });

  @override
  List<Object> get props => [
        canal,
      ];
}
