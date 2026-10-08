import 'package:flutter/material.dart';

class ChalkboardWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color shadowColor;

  const ChalkboardWidget({
    super.key,
    required this.text,
    required this.color,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          bottom: BorderSide(
            color: shadowColor,
            width: 8,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 48,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
