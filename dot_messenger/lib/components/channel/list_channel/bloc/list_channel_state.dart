part of 'list_channel_bloc.dart';

abstract class ListChannelState extends Equatable {
  const ListChannelState();

  @override
  List<Object> get props => [];
}

class ListChannelInitialState extends ListChannelState {}

class ListChannelLoadingState extends ListChannelState {}

class ListChannelLoadedState extends ListChannelState {
  final List<ChannelModel> canals;

  const ListChannelLoadedState({
    required this.canals,
  });

  @override
  List<Object> get props => [
        canals,
      ];
}
