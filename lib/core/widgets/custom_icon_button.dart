import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: EdgeInsets.only(top: _isPressed ? 3 : 0, bottom: _isPressed ? 0 : 3),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE5E5E5), width: 1.5),
          boxShadow: _isPressed
              ? []
              : const [
                  BoxShadow(
                    color: Color(0xFFD4D4D4),
                    offset: Offset(0, 3),
                    blurRadius: 0,
                  ),
                ],
        ),
        child: Center(
          child: Icon(
            widget.icon,
            color: AppColors.textHeading,
            size: 24,
          ),
        ),
      ),
    );
  }
}
