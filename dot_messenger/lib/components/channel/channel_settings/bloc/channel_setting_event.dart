part of 'channel_setting_bloc.dart';

abstract class ChannelSettingEvent extends Equatable {
  const ChannelSettingEvent();

  @override
  List<Object> get props => [];
}

class OnUpdateChannelSettingEvent extends ChannelSettingEvent {
  final String channelId;
  final Map<String, dynamic> channelSetting;

  const OnUpdateChannelSettingEvent({
    required this.channelId,
    required this.channelSetting,
  });

  @override
  List<Object> get props => [
        channelSetting,
      ];
}
