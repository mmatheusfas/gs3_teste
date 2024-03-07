import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Colors.indigo.shade500,
            Colors.indigo.shade400,
            Colors.indigo.shade300,
            Colors.indigo.shade200,
            Colors.indigo.shade200,
            Colors.indigo.shade50,
            Colors.white,
          ],
        ),
      ),
      child: child,
    );
  }
}
