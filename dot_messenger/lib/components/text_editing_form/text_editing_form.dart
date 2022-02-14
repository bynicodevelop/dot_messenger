import 'package:dot_messenger/configs/constants.dart';
import 'package:flutter/material.dart';

class TextEditingForm extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSend;

  const TextEditingForm({
    Key? key,
    required this.controller,
    required this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
        horizontal: kDefaultPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.attach_file,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Qu'avez-vous à dire ?",
              ),
            ),
          ),
          IconButton(
            onPressed: onSend,
            icon: const Icon(
              Icons.send,
            ),
          )
        ],
      ),
    );
  }
}
