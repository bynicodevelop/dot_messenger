import 'package:dot_messenger/components/channel/delete_channel/delete_channel_component.dart';
import 'package:dot_messenger/components/channel/leave_channel/leave_channel_component.dart';
import 'package:dot_messenger/components/user_component.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/models/user_model.dart';
import 'package:flutter/material.dart';

class ChannelSettingComponent extends StatelessWidget {
  final ChannelModel channelModel;

  const ChannelSettingComponent({
    Key? key,
    required this.channelModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel Setting'),
      ),
      body: Center(
        child: Column(
          children: [
            if (channelModel.isPersonal)
              DeleteChannelComponent(
                channelModel: channelModel,
              ),
            if (!channelModel.isPersonal)
              LeaveChannelComponent(
                channelModel: channelModel,
              )
          ],
        ),
      ),
    );
  }
}
