import 'package:dot_messenger/components/channel/leave_channel/bloc/leave_channel_bloc.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/widgets/buttons/danger_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaveChannelComponent extends StatelessWidget {
  final ChannelModel channelModel;

  const LeaveChannelComponent({
    Key? key,
    required this.channelModel,
  }) : super(key: key);

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Quitter le canal'),
      content: const Text(
          "Voulez-vous vraiment quitter le canal ? Vous ne pourrez plus accéder aux contenus."),
      actions: <Widget>[
        TextButton(
          child: const Text('Non'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        BlocListener<LeaveChannelBloc, LeaveChannelState>(
          listener: (context, state) {
            if (state is LeaveChannelLoadingState) {}

            if (state is LeaveChannelSuccessState) {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const ChannelsScreen(),
              //   ),
              //   (route) => false,
              // );
            }
          },
          child: TextButton(
            child: const Text('Oui'),
            onPressed: () {
              context.read<LeaveChannelBloc>().add(
                    OnLeaveChannel(
                      channelModel: channelModel,
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kDefaultPadding * 2.5,
      child: DangerButton(
        label: "Quitter le canal",
        onPressed: () => showDialog(
          context: context,
          builder: (context) => _buildDialog(context),
        ),
      ),
    );
  }
}
