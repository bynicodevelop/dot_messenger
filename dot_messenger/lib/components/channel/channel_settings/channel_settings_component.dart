import 'package:dot_messenger/components/channel/channel_editing_action/bloc/channel_editing_action_bloc.dart';
import 'package:dot_messenger/components/channel/channel_editing_action/channel_editing_action_component.dart';
import 'package:dot_messenger/components/channel/channel_settings/bloc/channel_setting_bloc.dart';
import 'package:dot_messenger/components/channel/delete_channel/delete_channel_component.dart';
import 'package:dot_messenger/components/channel/leave_channel/leave_channel_component.dart';
import 'package:dot_messenger/components/forms/inputs/text_input.dart';
import 'package:dot_messenger/components/profile_avatar/bloc/upload_file_bloc.dart';
import 'package:dot_messenger/components/profile_avatar/profile_avatar_component.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:dot_messenger/services/channel/channel_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChannelSettingComponent extends StatefulWidget {
  final ChannelModel channelModel;

  const ChannelSettingComponent({
    Key? key,
    required this.channelModel,
  }) : super(key: key);

  @override
  State<ChannelSettingComponent> createState() =>
      _ChannelSettingComponentState();
}

class _ChannelSettingComponentState extends State<ChannelSettingComponent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  String? _temporaryImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        actions: [
          if (widget.channelModel.isPersonal)
            Padding(
              padding: const EdgeInsets.only(
                right: kDefaultPadding / 2,
              ),
              child: ChannelEditingActionComponent(
                onSave: () {
                  context.read<ChannelSettingBloc>().add(
                        OnUpdateChannelSettingEvent(
                          channelId: widget.channelModel.id,
                          channelSetting: {
                            "title": _titleController.text,
                            "image": _temporaryImageUrl ?? _urlController.text,
                          },
                        ),
                      );
                },
              ),
            )
        ],
      ),
      body: BlocListener<ChannelSettingBloc, ChannelSettingState>(
        listener: (context, state) {
          if (state is ChannelSettingUpdatedState) {
            context.read<ChannelEditingActionBloc>().add(OnSwitchToEditMode());
          }
        },
        child: BlocBuilder<ChannelEditingActionBloc, ChannelEditingActionState>(
          builder: (context, state) {
            final bool isEditing =
                (state as ChannelEditingActionInitialState).isEditing;

            return BlocBuilder<ChannelBloc, ChannelState>(
              bloc: BlocProvider.of<ChannelBloc>(context)
                ..add(
                  OnChannelInitilizedEvent(widget.channelModel.id),
                ),
              builder: (context, state) {
                if (state is! ChannelLoadedState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final ChannelModel channelModel = state.channelModel;

                _titleController.text = channelModel.title;
                _urlController.text = channelModel.image;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                    horizontal: kDefaultPadding / 2,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: kDefaultPadding,
                          ),
                          child: BlocListener<UploadfileBloc, UploadFileState>(
                            listener: (context, state) {
                              if (state is UploadFileLoadingState) {
                                return;
                              }

                              if (state is UploadFileSuccessState) {
                                if (state.fileUrl.isNotEmpty) {
                                  setState(
                                    () => _temporaryImageUrl = state.fileUrl,
                                  );
                                }
                              }
                            },
                            child: ProfileAvatarComponent(
                              size: 70.0,
                              label: _titleController.text,
                              url: _temporaryImageUrl ?? _urlController.text,
                              isEditing: isEditing,
                              onChange: (XFile file) {
                                final String path =
                                    "channels/${widget.channelModel.id}/avatar";

                                context.read<UploadfileBloc>().add(
                                      OnUploadImageEvent(
                                        path: path,
                                        file: file,
                                      ),
                                    );
                              },
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            isEditing
                                ? TextInput(
                                    label: "Nom du canal",
                                    controller: _titleController,
                                  )
                                : Text(
                                    _titleController.text,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: kDefaultPadding,
                            bottom: kDefaultPadding * 1.5,
                          ),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        if (widget.channelModel.isPersonal)
                          DeleteChannelComponent(
                            channelModel: widget.channelModel,
                          ),
                        if (!widget.channelModel.isPersonal)
                          LeaveChannelComponent(
                            channelModel: widget.channelModel,
                          )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
