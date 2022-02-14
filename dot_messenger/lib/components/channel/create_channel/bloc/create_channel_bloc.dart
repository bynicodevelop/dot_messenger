import 'package:bloc/bloc.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/repositories/channel_repository.dart';
import 'package:equatable/equatable.dart';

part 'create_channel_event.dart';
part 'create_channel_state.dart';

class CreateChannelBloc extends Bloc<CreateChannelEvent, CreateChannelState> {
  final ChannelRepository channelRepository;

  CreateChannelBloc({
    required this.channelRepository,
  }) : super(CreateChannelInitialState()) {
    on<OnCreateChannelEvent>((event, emit) async {
      emit(CreateChannelLoadingState());

      final ChannelModel canal = ChannelModel(
        id: "uid",
        title: event.title,
        image: "",
        lastMessage: "",
        lastUpdated: DateTime.now(),
        createdAt: DateTime.now(),
      );

      await channelRepository.createChannel({
        "title": event.title,
      });

      emit(
        CreateChannelSuccessState(
          canal: canal,
        ),
      );
    });
  }
}
