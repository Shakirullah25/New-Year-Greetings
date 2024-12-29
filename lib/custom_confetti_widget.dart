import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CustomConfettiWidget extends StatelessWidget {
  final Alignment alignment;
  final ConfettiController confettiController;
  final double blastDirection;
  const CustomConfettiWidget({
    super.key,
    required this.alignment,
    required this.confettiController,
    required this.blastDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConfettiWidget(
        confettiController: confettiController,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        emissionFrequency: 0.02,
        shouldLoop: false,
        numberOfParticles: 100,
        maxBlastForce: 10,
        minBlastForce: 5,
        gravity: 0.3,
        colors: [
          Colors.black,
          Colors.white,
          Colors.red,
          Color(int.parse('0xFFFFD700')),
          Colors.purple,
          Colors.green,
        ],
      ),
    );
  }
}
