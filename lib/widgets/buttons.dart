import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      this.width,
      this.onTap,
      this.color,
      this.textColor});

  final String text;
  final double? width;
  final Function()? onTap;
  final Color? color, textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                color: color ?? Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              text,
              style: TextStyle(color: textColor),
            ))));
  }
}
