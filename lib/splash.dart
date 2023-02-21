import 'package:flutter/material.dart';
import 'package:foodwalas/src/constants/assets/assets_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          splash_gif,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
