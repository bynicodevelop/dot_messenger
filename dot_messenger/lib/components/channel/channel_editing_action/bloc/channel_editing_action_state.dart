part of 'channel_editing_action_bloc.dart';

abstract class ChannelEditingActionState extends Equatable {
  const ChannelEditingActionState();

  @override
  List<Object> get props => [];
}

class ChannelEditingActionInitialState extends ChannelEditingActionState {
  final bool isEditing;

  const ChannelEditingActionInitialState({
    this.isEditing = false,
  });

  @override
  List<Object> get props => [
        isEditing,
      ];
}
