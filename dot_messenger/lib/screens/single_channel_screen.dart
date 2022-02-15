import 'package:dot_messenger/components/channel/list_channel_messages/list_channel_messages_component.dart';
import 'package:dot_messenger/components/channel/send_message_channel/send_message_channel_component.dart';
import 'package:dot_messenger/components/channel/vertical_menu_component.dart';
import 'package:dot_messenger/services/channel/channel_bloc.dart';
import 'package:dot_messenger/widgets/profile_avatar_widget.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: BlocBuilder<ChannelBloc, ChannelState>(
          bloc: BlocProvider.of<ChannelBloc>(context)
            ..add(
              OnChannelInitilizedEvent(channelModel.id),
            ),
          builder: (context, state) {
            if (state is! ChannelLoadedState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final ChannelModel channelModel = state.channelModel;

            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: kDefaultPadding / 2,
                  ),
                  child: ProfileAvatarWidget(
                    size: 20,
                    label: channelModel.title,
                    url: channelModel.image.isEmpty ? null : channelModel.image,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(channelModel.title),
                  ],
                )
              ],
            );
          },
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
