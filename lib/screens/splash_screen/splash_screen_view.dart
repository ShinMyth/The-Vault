import 'package:vault/screens/sign_in_screen/sign_in_screen_view.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (builder) => const SignInScreenView()),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen View"),
      ),
    );
  }
}
