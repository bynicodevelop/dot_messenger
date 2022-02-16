import 'package:dot_messenger/components/channel/list_channel_messages/bloc/list_channel_message_bloc.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/models/message_model.dart';
import 'package:dot_messenger/widgets/messages/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListChannelMessageComponent extends StatelessWidget {
  final ChannelModel channelModel;

  const ListChannelMessageComponent({
    Key? key,
    required this.channelModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListChannelMessageBloc, ListChannelMessageState>(
      bloc: BlocProvider.of<ListChannelMessageBloc>(context)
        ..add(
          OnListChannelMessageEvent(
            channelModel: channelModel,
          ),
        ),
      builder: (context, state) {
        if (state is! ListChannelMessageLoadedState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<MessageModel> messages = state.messages;

        if (messages.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: kDefaultPadding / 2,
                  ),
                  child: Icon(Icons.info_outline),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: kDefaultPadding * 4,
                  ),
                  child: Text('No messages'),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return ItemMessagesWidget(
              channelModel: channelModel,
              messageModel: messages[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: kDefaultPadding / 2,
          ),
        );
      },
    );
  }
}
