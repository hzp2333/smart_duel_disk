import 'package:flutter/material.dart';

class BorderedText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const BorderedText({
    required this.text,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: style.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,
          ),
        ),
        Text(
          text,
          style: style,
        ),
      ],
    );
  }
}
