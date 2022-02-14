import 'package:dot_messenger/components/channel/list_channel_messages/list_channel_messages_component.dart';
import 'package:dot_messenger/components/channel/send_message_channel/send_message_channel_component.dart';
import 'package:dot_messenger/components/channel/vertical_menu_component.dart';
import 'package:dot_messenger/components/profile_avatar.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:flutter/material.dart';

class SingleChannelScreen extends StatelessWidget {
  final ChannelModel channelModel;

  const SingleChannelScreen({
    Key? key,
    required this.channelModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: kDefaultPadding / 2,
              ),
              child: ProfileAvatar(
                size: 20,
                label: channelModel.title,
                url: channelModel.image.isEmpty ? null : channelModel.image,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(channelModel.title)],
            )
          ],
        ),
        actions: [
          VerticalMenuComponent(
            channelModel: channelModel,
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListChannelMessageComponent(
              channelModel: channelModel,
            ),
            if (channelModel.isPersonal)
              SendMessageChannelComponent(
                channelModel: channelModel,
              ),
          ],
        ),
      ),
    );
  }
}
