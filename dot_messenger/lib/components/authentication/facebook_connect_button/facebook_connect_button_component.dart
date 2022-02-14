import 'package:dot_messenger/components/authentication/facebook_connect_button/bloc/facebook_connect_bloc.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/widgets/buttons/social_connect_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookConnectButtonComponent extends StatelessWidget {
  const FacebookConnectButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialButtonConnect(
      onPressed: () =>
          context.read<FacebookConnectBloc>().add(OnFacebookConnectEvent()),
      label: "Facebook",
      icon: const Icon(
        FontAwesomeIcons.facebook,
        size: kDefaultPadding,
      ),
    );
  }
}
