import 'package:dot_messenger/components/authentication/login_form/login_form_component.dart';
import 'package:dot_messenger/configs/constants.dart';
import 'package:dot_messenger/screens/authentication/register_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      _emailController.text = "john@domain.tld";
      _passwordController.text = "123456";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Connexion",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Row(
                  children: [
                    const Text("Ou"),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      ),
                      child: const Text("Créer un compte"),
                    ),
                  ],
                ),
                const LoginFormComponent(),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: kDefaultPadding / 2,
                //     bottom: kDefaultPadding,
                //   ),
                //   child: Row(
                //     children: [
                //       const Expanded(
                //         child: Divider(
                //           color: Colors.grey,
                //           thickness: 1,
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(
                //           horizontal: kDefaultPadding / 2,
                //         ),
                //         child: Text(
                //           "Ou continuer avec",
                //           style:
                //               Theme.of(context).textTheme.bodyText1!.copyWith(
                //                     color: Colors.grey[700],
                //                   ),
                //         ),
                //       ),
                //       const Expanded(
                //         child: Divider(
                //           color: Colors.grey,
                //           thickness: 1,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Row(
                //   children: const [
                //     Expanded(
                //       child: FacebookConnectButtonComponent(),
                //     ),
                //     SizedBox(
                //       width: kDefaultPadding / 2,
                //     ),
                //     Expanded(
                //       child: GoogleConnectButtonComponent(),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
