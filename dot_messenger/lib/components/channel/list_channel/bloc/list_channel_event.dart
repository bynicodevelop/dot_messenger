part of 'list_channel_bloc.dart';

abstract class ListChannelEvent extends Equatable {
  const ListChannelEvent();

  @override
  List<Object> get props => [];
}

class OnLoadChannelsEvent extends ListChannelEvent {
  final List<ChannelModel> canals;

  const OnLoadChannelsEvent({
    required this.canals,
  });

  @override
  List<Object> get props => [
        canals,
      ];
}
