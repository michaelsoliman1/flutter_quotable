import 'package:flutter/material.dart';

/// App Splash Screen
class SplashScreen extends StatelessWidget {
  /// App Splash Screen
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 200,
              image: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator.adaptive()
          ],
        ),
      ),
    );
  }
}
