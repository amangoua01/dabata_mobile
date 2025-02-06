import 'package:custom_linear_progress_indicator/custom_linear_progress_indicator.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  const ProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return CustomLinearProgressIndicator(
      maxValue: 1, // new
      value: value,
      minHeight: 20,
      borderWidth: 1,
      borderColor: Colors.black,
      colorLinearProgress: Colors.green,
      animationDuration: 1000,
      borderRadius: 3,
      progressAnimationCurve: Curves.bounceInOut, // new
      alignment: Alignment.center, // new
      showPercent: true,
      percentTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      onProgressChanged: (double value) {
        // new
        print('Progress: $value');
      },
    );
  }
}
