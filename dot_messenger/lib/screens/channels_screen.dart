import 'package:dot_messenger/components/channel/create_channel/create_channel_component.dart';
import 'package:dot_messenger/components/channel/list_channel/bloc/list_channel_bloc.dart';
import 'package:dot_messenger/components/channel/list_channel/list_channel_component.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/models/channel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChannelsScreen extends StatefulWidget {
  const ChannelsScreen({Key? key}) : super(key: key);

  @override
  State<ChannelsScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelsScreen> {
  void _modalBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          kDefaultPadding * 1.8,
        ),
      ),
      builder: (BuildContext context) => const CreateChannelComponent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channels'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () => _modalBottomSheet(
              context,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ListChannelBloc, ListChannelState>(
          builder: (context, state) {
        if (state is ListChannelInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<ChannelModel> channels =
            (state as ListChannelLoadedState).canals;

        if (channels.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Aucun canal'),
                TextButton(
                  onPressed: () {},
                  child: const Text("Créer un canal"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                  ),
                )
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 2,
                ),
                child: Text(
                  "Mes canaux".toUpperCase(),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: kDefaultFontSize / 1.3,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1,
                      ),
                ),
              ),
              ListChannelComponent(
                channels: channels,
                isPersonalList: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 2,
                ),
                child: Text(
                  "Mes souscriptions".toUpperCase(),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: kDefaultFontSize / 1.3,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1,
                      ),
                ),
              ),
              ListChannelComponent(
                channels: channels,
              ),
            ],
          ),
        );
      }),
    );
  }
}
