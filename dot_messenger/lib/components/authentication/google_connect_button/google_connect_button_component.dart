import 'package:dot_messenger/components/authentication/google_connect_button/bloc/google_connect_bloc.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/widgets/buttons/social_connect_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleConnectButtonComponent extends StatelessWidget {
  const GoogleConnectButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialButtonConnect(
      onPressed: () => context.read<GoogleConnectBloc>().add(
            OnGoogleConnectEvent(),
          ),
      label: "Google",
      icon: const Icon(
        FontAwesomeIcons.google,
        size: kDefaultPadding,
      ),
    );
  }
}
