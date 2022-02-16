import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/models/message_model.dart';
import 'package:dot_messenger/widgets/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ItemMessagesWidget extends StatelessWidget {
  final ChannelModel channelModel;
  final MessageModel messageModel;

  const ItemMessagesWidget({
    Key? key,
    required this.channelModel,
    required this.messageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileAvatarWidget(
        label: channelModel.title,
        url: channelModel.image,
        size: 20,
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: kDefaultPadding / 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  channelModel.title,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                ),
                Text(
                  timeago
                      .format(
                        messageModel.createdAt,
                      )
                      .toUpperCase(),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          Text(messageModel.content),
        ],
      ),
    );
  }
}
