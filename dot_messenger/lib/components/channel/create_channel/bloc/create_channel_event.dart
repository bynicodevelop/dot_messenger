part of 'create_channel_bloc.dart';

abstract class CreateChannelEvent extends Equatable {
  const CreateChannelEvent();

  @override
  List<Object> get props => [];
}

class OnCreateChannelEvent extends CreateChannelEvent {
  final String title;

  const OnCreateChannelEvent({
    required this.title,
  });

  @override
  List<Object> get props => [
        title,
      ];
}
