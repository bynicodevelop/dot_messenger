import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'channel_editing_action_event.dart';
part 'channel_editing_action_state.dart';

class ChannelEditingActionBloc
    extends Bloc<ChannelEditingActionEvent, ChannelEditingActionState> {
  bool editing = false;

  ChannelEditingActionBloc() : super(const ChannelEditingActionInitialState()) {
    on<OnSwitchToEditMode>((event, emit) {
      editing = !editing;

      emit(ChannelEditingActionInitialState(
        isEditing: editing,
      ));
    });
  }
}
