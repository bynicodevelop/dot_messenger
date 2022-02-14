import 'package:dot_messenger/components/forms/inputs/abstract_input.dart';
import 'package:dot_messenger/components/forms/validators/email_validator.dart';
import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String errorText;

  const EmailInput({
    Key? key,
    required this.controller,
    this.label = "Email",
    this.errorText = "Please enter a valid email",
  }) : super(key: key);

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final FocusNode _focusNode = FocusNode();

  bool hasError = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() => hasError = false);

      if (!_focusNode.hasFocus) {
        final EmailValidator emailValidator =
            EmailValidator.dirty(widget.controller.text);

        setState(() => hasError = !emailValidator.valid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AbstractInput(
      focusNode: _focusNode,
      controller: widget.controller,
      label: widget.label,
      keyboardType: TextInputType.emailAddress,
      errorText: hasError ? widget.errorText : null,
    );
  }
}
