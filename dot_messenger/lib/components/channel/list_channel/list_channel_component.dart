import 'package:dot_messenger/screens/single_channel_screen.dart';
import 'package:dot_messenger/components/profile_avatar.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListChannelComponent extends StatelessWidget {
  final List<ChannelModel> channels;
  final bool isPersonalList;

  const ListChannelComponent({
    Key? key,
    required this.channels,
    this.isPersonalList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: channels.length,
      itemBuilder: (BuildContext context, int index) {
        final ChannelModel channelModel = channels[index];

        if (channelModel.isPersonal != isPersonalList) {
          return const SizedBox.shrink();
        }

        return ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SingleChannelScreen(
                channelModel: channelModel,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            right: kDefaultPadding * 1.2,
            left: kDefaultPadding / 2,
          ),
          leading: ProfileAvatar(
            label: channelModel.title,
            url: channelModel.image,
          ),
          title: Padding(
            padding: const EdgeInsets.only(
              bottom: kDefaultPadding / 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        channelModel.lastUpdated,
                      )
                      .toUpperCase(),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
          subtitle: Text(
            channelModel.lastMessage.isEmpty ? "..." : channelModel.lastMessage,
            style: Theme.of(context).textTheme.bodyText2!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        final ChannelModel channelModel = channels[index];

        if (channelModel.isPersonal != isPersonalList) {
          return const SizedBox.shrink();
        }

        return const SizedBox(
          height: kDefaultPadding / 1.5,
        );
      },
    );
  }
}
