import 'package:dot_messenger/components/channel/channel_editing_action/bloc/channel_editing_action_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChannelEditingActionComponent extends StatelessWidget {
  final Function() onSave;

  const ChannelEditingActionComponent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelEditingActionBloc, ChannelEditingActionState>(
      builder: (context, state) {
        return (state as ChannelEditingActionInitialState).isEditing
            ? TextButton(
                onPressed: onSave,
                child: Text(
                  "Enregistrer",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            : TextButton(
                onPressed: () {
                  context.read<ChannelEditingActionBloc>().add(
                        OnSwitchToEditMode(),
                      );
                },
                child: Text(
                  "Modifier",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
      },
    );
  }
}
