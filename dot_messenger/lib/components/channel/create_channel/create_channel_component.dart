import 'package:dot_messenger/components/channel/create_channel/bloc/create_channel_bloc.dart';
import 'package:dot_messenger/components/forms/inputs/text_input.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CreateChannelComponent extends StatefulWidget {
  const CreateChannelComponent({Key? key}) : super(key: key);

  @override
  State<CreateChannelComponent> createState() => _CreateChannelModalState();
}

class _CreateChannelModalState extends State<CreateChannelComponent> {
  final TextEditingController _textController = TextEditingController();

  bool disabled = true;

  @override
  void initState() {
    super.initState();

    _textController.addListener(() {
      setState(() => disabled = _textController.text.isEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateChannelBloc, CreateChannelState>(
        listener: (context, state) {
          if (state is CreateChannelLoadingState) {}

          if (state is CreateChannelSuccessState) {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: kDefaultPadding,
            bottom: kDefaultPadding * 1.5,
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width - 170) / 2,
                  right: (MediaQuery.of(context).size.width - 170) / 2,
                  bottom: kDefaultPadding,
                ),
                child: const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              TextInput(
                controller: _textController,
                label: "Nom du canal",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel".toUpperCase(),
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: kDefaultPadding / 2,
                    ),
                    child: TextButton(
                      onPressed: disabled
                          ? null
                          : () => context.read<CreateChannelBloc>().add(
                                OnCreateChannelEvent(
                                  title: _textController.text,
                                ),
                              ),
                      child: Text(
                        "Créer".toUpperCase(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
