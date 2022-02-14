import 'package:dot_messenger/components/forms/inputs/abstract_input.dart';
import 'package:dot_messenger/components/forms/validators/password_validator.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String errorText;

  const PasswordInput({
    Key? key,
    required this.controller,
    this.label = "Password",
    this.errorText = "Password is required (6 characters)",
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;

  bool hasError = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() => hasError = false);

      if (!_focusNode.hasFocus) {
        final PasswordValidator passwordValidator =
            PasswordValidator.dirty(widget.controller.text);

        setState(() => hasError = !passwordValidator.valid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AbstractInput(
      focusNode: _focusNode,
      controller: widget.controller,
      obscureText: _obscureText,
      label: widget.label,
      keyboardType: TextInputType.text,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.remove_red_eye : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      errorText: hasError ? widget.errorText : null,
    );
  }
}
