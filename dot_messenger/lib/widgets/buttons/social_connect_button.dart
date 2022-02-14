import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter/material.dart';

class SocialButtonConnect extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Icon icon;

  const SocialButtonConnect({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kDefaultPadding * 2,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: kDefaultPadding / 3),
              child: icon,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
