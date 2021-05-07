import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SizedBox.shrink(),
                ),
                Text(
                  'Smart Duel\nDisk',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
