import 'package:bloc/bloc.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/repositories/channel_repository.dart';
import 'package:equatable/equatable.dart';

part 'leave_channel_event.dart';
part 'leave_channel_state.dart';

class LeaveChannelBloc extends Bloc<LeaveChannelEvent, LeaveChannelState> {
  final ChannelRepository channelRepository;

  LeaveChannelBloc({
    required this.channelRepository,
  }) : super(LeaveChannelInitialState()) {
    on<OnLeaveChannel>((event, emit) async {
      emit(LeaveChannelLoadingState());

      await channelRepository.leaveChannel(event.channelModel.id);

      emit(LeaveChannelSuccessState());
    });
  }
}
