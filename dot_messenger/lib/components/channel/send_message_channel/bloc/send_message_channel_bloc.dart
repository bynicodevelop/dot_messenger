import 'package:bloc/bloc.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/repositories/channel_message_repository.dart';
import 'package:equatable/equatable.dart';

part 'send_message_channel_event.dart';
part 'send_message_channel_state.dart';

class SendMessageChannelBloc
    extends Bloc<SendMessageChannelEvent, SendMessageChannelState> {
  final ChannelMessageRepository channelMessageRepository;

  SendMessageChannelBloc({
    required this.channelMessageRepository,
  }) : super(SendMessageInitialState()) {
    on<OnSendMessageEvent>((event, emit) async {
      emit(SendMessageLoadingState());

      await channelMessageRepository.sendMessage(
        event.channelModel.id,
        event.content,
      );

      emit(SendMessageSuccessState());
    });
  }
}
