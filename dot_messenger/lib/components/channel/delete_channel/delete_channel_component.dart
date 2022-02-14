import 'package:dot_messenger/components/channel/delete_channel/bloc/delete_channel_bloc.dart';
import "package:dot_messenger/configs/constants.dart";
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/widgets/buttons/danger_button.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

class DeleteChannelComponent extends StatelessWidget {
  final ChannelModel channelModel;

  const DeleteChannelComponent({
    Key? key,
    required this.channelModel,
  }) : super(key: key);

  AlertDialog _buildDialog(BuildContext context) => AlertDialog(
        title: Text(
          "Supprimer le canal",
          style: Theme.of(context).textTheme.headline6,
        ),
        content: const Text(
          "Voulez-vous vraiment supprimer ce canal ? Vous ne pourrez plus acceder aux messages et ils seront définitivement supprimés.",
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Annuler"),
            onPressed: () => Navigator.pop(context),
          ),
          BlocListener<DeleteChannelBloc, DeleteChannelState>(
            listener: (context, state) {
              if (state is DeleteChannelLoadingState) {}

              if (state is DeleteChannelSuccessState) {
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
              child: const Text("Accepter"),
              onPressed: () => context.read<DeleteChannelBloc>().add(
                    OnDeleteChannelEvent(
                      canal: channelModel,
                    ),
                  ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kDefaultPadding * 2.5,
      child: DangerButton(
        label: "Supprimer le canal",
        onPressed: () => showDialog(
          context: context,
          builder: (context) => _buildDialog(context),
        ),
      ),
    );
  }
}
