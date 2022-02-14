import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter/material.dart';

class DangerButton extends StatelessWidget {
  final Function() onPressed;
  final String label;

  const DangerButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        primary: kDangerColor,
      ),
    );
  }
}
