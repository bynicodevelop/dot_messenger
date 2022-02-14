import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  final String title;
  final IconData? icon;

  const EmptyListWidget({
    Key? key,
    this.title = "It's empty here",
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
            child: Icon(icon ?? Icons.info_outline),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: kDefaultPadding * 4,
            ),
            child: Text(title),
          ),
        ],
      ),
    );
  }
}
