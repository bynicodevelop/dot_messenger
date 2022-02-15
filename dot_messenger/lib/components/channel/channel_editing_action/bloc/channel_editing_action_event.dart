part of 'channel_editing_action_bloc.dart';

abstract class ChannelEditingActionEvent extends Equatable {
  const ChannelEditingActionEvent();

  @override
  List<Object> get props => [];
}

class OnSwitchToEditMode extends ChannelEditingActionEvent {}
