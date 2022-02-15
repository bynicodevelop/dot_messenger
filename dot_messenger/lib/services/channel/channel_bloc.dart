import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/repositories/channel_message_repository.dart';
import 'package:equatable/equatable.dart';

part 'channel_event.dart';
part 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final ChannelMessageRepository channelMessageRepository;

  ChannelBloc({
    required this.channelMessageRepository,
  }) : super(ChannelInitialState()) {
    on<OnChannelInitilizedEvent>((event, emit) {
      emit(ChannelLoadingState());

      channelMessageRepository.channel(event.channelId).listen((event) {
        add(OnChannelUpdatedEvent(
          channelModel: event,
        ));
      });
    });

    on<OnChannelUpdatedEvent>((event, emit) {
      emit(ChannelLoadedState(
        channelModel: event.channelModel,
      ));
    });
  }
}
