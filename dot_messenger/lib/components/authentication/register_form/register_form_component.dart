import 'package:dot_messenger/components/authentication/register_form/bloc/register_form_bloc.dart';
import 'package:dot_messenger/components/forms/buttons/submit_button.dart';
import 'package:dot_messenger/components/forms/inputs/email_input.dart';
import 'package:dot_messenger/components/forms/inputs/password_input.dart';
import 'package:dot_messenger/components/forms/inputs/text_input.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RegisterFormComponent extends StatefulWidget {
  const RegisterFormComponent({Key? key}) : super(key: key);

  @override
  State<RegisterFormComponent> createState() => _RegisterFormComponentState();
}

class _RegisterFormComponentState extends State<RegisterFormComponent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      _nameController.text = "jeff";
      _emailController.text = "jeff@domain.tld";
      _passwordController.text = "123456";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
      listener: (context, state) {
        if (state is RegisterFormLoadingState) {
          return;
        }

        if (state is RegisterFormSuccessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false,
          );
        }

        if (state is RegisterFormFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Vous ne pouvez vous enregistrer avec ces identifiants.",
              ),
              backgroundColor: kDangerColor,
            ),
          );
          return;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            TextInput(
              label: "Nom",
              controller: _nameController,
            ),
            EmailInput(
              controller: _emailController,
            ),
            PasswordInput(
              controller: _passwordController,
            ),
            SubmitButton(
              label: "Créer un compte".toUpperCase(),
              onPressed: (state is RegisterFormLoadingState)
                  ? null
                  : () {
                      if (_emailController.text.isEmpty &&
                          _passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez remplir tous les champs"),
                          ),
                        );

                        return null;
                      }

                      context.read<RegisterFormBloc>().add(
                            OnRegisterFormEvent(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                    },
            ),
          ],
        );
      },
    );
  }
}
