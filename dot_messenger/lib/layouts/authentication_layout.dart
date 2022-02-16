import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter/material.dart';

class AuthenticationLayout extends StatelessWidget {
  final Widget heading;
  final Widget form;

  const AuthenticationLayout({
    Key? key,
    required this.heading,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: kDefaultPadding,
                ),
                child: heading,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: kDefaultPadding,
                ),
                child: form,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
