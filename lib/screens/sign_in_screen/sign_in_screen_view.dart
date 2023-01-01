import 'package:vault/screens/accounts_screen/accounts_screen_view.dart';
import 'package:flutter/material.dart';

class SignInScreenView extends StatefulWidget {
  const SignInScreenView({Key? key}) : super(key: key);

  @override
  State<SignInScreenView> createState() => _SignInScreenViewState();
}

class _SignInScreenViewState extends State<SignInScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Sign In Screen View"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const AccountsScreenView()),
                );
              },
              child: const Text("Sign In"),
            )
          ],
        ),
      ),
    );
  }
}
