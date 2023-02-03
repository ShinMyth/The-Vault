import 'package:vault/screens/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  late SplashScreenController controller;

  @override
  void initState() {
    controller = SplashScreenController(
      setstate: () => setState(() {}),
      context: context,
    );

    controller.initializeSqfliteDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 35.w,
          width: 35.w,
          child: Image.asset("assets/images/flutter-logo-with-label.png"),
        ),
      ),
    );
  }
}
