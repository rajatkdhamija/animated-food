import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TextAnimator extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool autoPlay;
  final AnimationController controller;

  const TextAnimator(
      {super.key,
      required this.text,
      required this.style,
      this.autoPlay = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style)
        .animate(controller: controller, autoPlay: autoPlay)
        .fade()
        .slideY(
          begin: -1,
          end: 0,
          duration: const Duration(milliseconds: 300),
        );
  }
}
