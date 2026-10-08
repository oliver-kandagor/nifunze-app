import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        if (!widget.isLoading) setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        if (!widget.isLoading) {
          setState(() => _isPressed = false);
          widget.onPressed();
        }
      },
      onTapCancel: () {
        if (!widget.isLoading) setState(() => _isPressed = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: EdgeInsets.only(top: _isPressed ? 4 : 0, bottom: _isPressed ? 0 : 4),
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderGrey, width: 2),
          boxShadow: _isPressed
              ? []
              : [
                  const BoxShadow(
                    color: AppColors.shadowGrey,
                    offset: Offset(0, 4),
                    blurRadius: 0,
                  ),
                ],
        ),
        child: Center(
          child: widget.isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: AppColors.textHeading,
                  ),
                )
              : Text(
                  widget.text,
                  style: AppTypography.textTheme.labelLarge?.copyWith(
                    color: AppColors.textHeading,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
