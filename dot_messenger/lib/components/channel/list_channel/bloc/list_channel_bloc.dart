import 'package:bloc/bloc.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/repositories/channel_repository.dart';
import 'package:equatable/equatable.dart';

part 'list_channel_event.dart';
part 'list_channel_state.dart';

class ListChannelBloc extends Bloc<ListChannelEvent, ListChannelState> {
  final ChannelRepository channelRepository;

  ListChannelBloc({
    required this.channelRepository,
  }) : super(ListChannelInitialState()) {
    channelRepository.canals.listen((canals) {
      add(OnLoadChannelsEvent(
        canals: canals,
      ));
    });

    on<OnLoadChannelsEvent>((event, emit) {
      emit(ListChannelLoadedState(
        canals: event.canals,
      ));
    });
  }
}
