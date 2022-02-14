part of 'delete_channel_bloc.dart';

abstract class DeleteChannelEvent extends Equatable {
  const DeleteChannelEvent();

  @override
  List<Object> get props => [];
}

class OnDeleteChannelEvent extends DeleteChannelEvent {
  final ChannelModel canal;

  const OnDeleteChannelEvent({
    required this.canal,
  });

  @override
  List<Object> get props => [
        canal,
      ];
}
