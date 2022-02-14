import 'package:dot_messenger/components/forms/inputs/abstract_input.dart';
import 'package:dot_messenger/components/forms/validators/required_validator.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String errorText;
  final bool required;

  const TextInput({
    Key? key,
    required this.controller,
    this.label = "Email",
    this.errorText = "Please enter a valid email",
    this.required = false,
  }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final FocusNode _focusNode = FocusNode();

  bool hasError = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() => hasError = false);

      if (!_focusNode.hasFocus && widget.required) {
        final RequiredValidator requiredValidator =
            RequiredValidator.dirty(widget.controller.text);

        setState(() => hasError = !requiredValidator.valid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AbstractInput(
      focusNode: _focusNode,
      controller: widget.controller,
      label: widget.label,
      keyboardType: TextInputType.text,
      errorText: hasError ? widget.errorText : null,
    );
  }
}
