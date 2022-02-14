import 'package:dot_messenger/components/authentication/forgotten_form/bloc/forgotten_form_bloc.dart';
import 'package:dot_messenger/components/forms/buttons/submit_button.dart';
import 'package:dot_messenger/components/forms/inputs/email_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgottenFormComponent extends StatefulWidget {
  const ForgottenFormComponent({Key? key}) : super(key: key);

  @override
  State<ForgottenFormComponent> createState() => _ForgottenFormComponentState();
}

class _ForgottenFormComponentState extends State<ForgottenFormComponent> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      _emailController.text = "john@domain.tld";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgottenFormBloc, ForgottenFormState>(
      listener: (context, state) {
        if (state is ForgottenFormLoadingState) {
          return;
        }

        if (state is ForgottenFormSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Vous avez reçu un email pour réinitialiser votre mot de passe.",
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            EmailInput(
              controller: _emailController,
            ),
            SubmitButton(
              onPressed: (state is ForgottenFormLoadingState)
                  ? null
                  : () {
                      if (_emailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez remplir tous les champs."),
                          ),
                        );

                        return null;
                      }

                      context.read<ForgottenFormBloc>().add(
                            OnForgottenFormEvent(
                              email: _emailController.text,
                            ),
                          );
                    },
              label: "Réinitialiser mon mot de passe",
            ),
          ],
        );
      },
    );
  }
}
