import 'package:bloc/bloc.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/models/message_model.dart';
import 'package:dot_messenger/repositories/channel_message_repository.dart';
import 'package:dot_messenger/repositories/channel_repository.dart';
import 'package:equatable/equatable.dart';

part 'list_channel_message_event.dart';
part 'list_channel_message_state.dart';

class ListChannelMessageBloc
    extends Bloc<ListChannelMessageEvent, ListChannelMessageState> {
  final ChannelMessageRepository channelMessageRepository;

  ListChannelMessageBloc({
    required this.channelMessageRepository,
  }) : super(ListChannelMessageInitialState()) {
    on<OnListChannelMessageEvent>((event, emit) {
      emit(ListChannelMessageLoadingState());

      channelMessageRepository.messages(event.channelModel.id).listen(
            (messages) => add(_OnListChannelMessageState(
              messages: messages,
            )),
          );
    });

    on<_OnListChannelMessageState>((event, emit) {
      emit(ListChannelMessageLoadedState(
        messages: event.messages,
      ));
    });
  }
}
