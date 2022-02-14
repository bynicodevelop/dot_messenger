import 'package:dot_messenger/components/channel/channel_settings/channel_settings_component.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:flutter/material.dart';

class VerticalMenuComponent extends StatelessWidget {
  final ChannelModel channelModel;

  const VerticalMenuComponent({
    Key? key,
    required this.channelModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
      ), //don't specify icon if you want 3 dot menu
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 0,
          child: Row(children: [
            const Padding(
              padding: EdgeInsets.only(right: kDefaultPadding / 2),
              child: Icon(
                Icons.settings,
              ),
            ),
            Text(
              "Paramètres",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ]),
        ),
      ],
      onSelected: (item) => {
        if (item == 0)
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChannelSettingComponent(
                  channelModel: channelModel,
                ),
              ),
            )
          }
      },
    );
  }
}
