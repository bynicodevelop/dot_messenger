import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter/material.dart';

class AbstractInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final IconButton? suffixIcon;
  final String? errorText;
  final bool obscureText;

  const AbstractInput({
    Key? key,
    required this.label,
    required this.controller,
    required this.focusNode,
    this.keyboardType,
    this.suffixIcon,
    this.errorText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: suffixIcon,
          errorText: errorText,
        ),
      ),
    );
  }
}
