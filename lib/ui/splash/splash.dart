import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parvaz_event/ui/login_choice.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return LoginChoice(loginBool: false);
          },
        ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.background,
      child: Stack(
        children: [
          Center(
            child: Lottie.asset('assets/animations/book.json',
                repeat: false, width: 150),
          ),
          Positioned(
            bottom: 45,
            right: 0,
            left: 0,
            child: Text(
              'رمان مضطرب',
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}