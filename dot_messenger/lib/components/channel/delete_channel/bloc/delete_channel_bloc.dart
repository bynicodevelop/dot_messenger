import 'package:bloc/bloc.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/repositories/channel_repository.dart';
import 'package:equatable/equatable.dart';

part 'delete_channel_event.dart';
part 'delete_channel_state.dart';

class DeleteChannelBloc extends Bloc<DeleteChannelEvent, DeleteChannelState> {
  final ChannelRepository channelRepository;

  DeleteChannelBloc({
    required this.channelRepository,
  }) : super(DeleteChannelInitialState()) {
    on<OnDeleteChannelEvent>((event, emit) async {
      emit(DeleteChannelLoadingState());

      await channelRepository.deleteChannel(
        event.canal.id,
      );

      emit(DeleteChannelSuccessState());
    });
  }
}
