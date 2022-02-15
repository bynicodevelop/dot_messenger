part of 'channel_setting_bloc.dart';

abstract class ChannelSettingState extends Equatable {
  const ChannelSettingState();

  @override
  List<Object> get props => [];
}

class ChannelSettingInitialState extends ChannelSettingState {}

class ChannelSettingLoadingState extends ChannelSettingState {}

class ChannelSettingUpdatedState extends ChannelSettingState {}

class ChannelSettingErrorState extends ChannelSettingState {
  final String error;

  const ChannelSettingErrorState(this.error);

  @override
  List<Object> get props => [
        error,
      ];
}
