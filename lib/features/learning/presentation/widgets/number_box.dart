import 'package:flutter/material.dart';

class NumberBox extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? shadowColor;
  final Color? textColor;

  const NumberBox({
    super.key,
    required this.text,
    this.color,
    this.shadowColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: shadowColor ?? const Color(0xFFE5E5E5), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? const Color(0xFFD4D4D4),
            offset: const Offset(0, 3),
            blurRadius: 0,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: text == '...'
          ? Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            )
          : Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
    );
  }
}
