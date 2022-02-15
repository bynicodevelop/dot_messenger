import 'package:bloc/bloc.dart';
import 'package:dot_messenger/repositories/channel_repository.dart';
import 'package:equatable/equatable.dart';

part 'channel_setting_event.dart';
part 'channel_setting_state.dart';

class ChannelSettingBloc
    extends Bloc<ChannelSettingEvent, ChannelSettingState> {
  final ChannelRepository channelRepository;

  ChannelSettingBloc({
    required this.channelRepository,
  }) : super(ChannelSettingInitialState()) {
    on<OnUpdateChannelSettingEvent>((event, emit) async {
      emit(ChannelSettingLoadingState());

      await channelRepository.updateChannel(
        event.channelSetting,
        event.channelId,
      );

      emit(ChannelSettingUpdatedState());
    });
  }
}
