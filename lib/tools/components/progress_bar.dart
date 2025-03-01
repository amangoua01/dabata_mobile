import 'package:custom_linear_progress_indicator/custom_linear_progress_indicator.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  const ProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return CustomLinearProgressIndicator(
      maxValue: 1,
      value: value,
      minHeight: 27,
      borderWidth: 1,
      borderColor: Colors.grey,
      backgroundColor: Colors.grey.shade200,
      colorLinearProgress: value <= 0.33
          ? Colors.red
          : value <= 0.66
              ? Colors.orange
              : Colors.green,
      animationDuration: 1000,
      borderRadius: 3,
      progressAnimationCurve: Curves.bounceInOut,
      alignment: Alignment.center,
      showPercent: true,
      percentTextStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
