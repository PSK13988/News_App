import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:styli/configs/app_assets.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => AnimatedSplashScreen(
        splash: logo,
        nextScreen: const HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 1,
        splashIconSize: 250,
      );
}
