import 'package:dot_messenger/components/channel/send_message_channel/bloc/send_message_channel_bloc.dart';
import 'package:dot_messenger/components/text_editing_form/text_editing_form.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SendMessageChannelComponent extends StatefulWidget {
  final ChannelModel channelModel;

  const SendMessageChannelComponent({
    Key? key,
    required this.channelModel,
  }) : super(key: key);

  @override
  State<SendMessageChannelComponent> createState() =>
      _SendMessageChannelComponentState();
}

class _SendMessageChannelComponentState
    extends State<SendMessageChannelComponent> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextEditingForm(
      controller: _textEditingController,
      onSend: () {
        context.read<SendMessageChannelBloc>().add(
              OnSendMessageEvent(
                channelModel: widget.channelModel,
                content: {
                  "content": _textEditingController.text,
                },
              ),
            );
      },
    );
  }
}
