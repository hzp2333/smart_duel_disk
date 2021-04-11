import 'package:flutter/material.dart';

class BorderedText extends StatelessWidget {
  final String text;

  const BorderedText({
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,
          ),
        ),
        Text(text),
      ],
    );
  }
}
