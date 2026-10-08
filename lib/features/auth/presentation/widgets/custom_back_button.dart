import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatefulWidget {
  final IconData icon;

  const CustomBackButton({
    super.key,
    this.icon = Icons.chevron_left,
  });

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        if (context.canPop()) {
          context.pop();
        }
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: EdgeInsets.only(top: _isPressed ? 3 : 0, bottom: _isPressed ? 0 : 3),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderGrey, width: 2),
          boxShadow: _isPressed
              ? []
              : [
                  const BoxShadow(
                    color: AppColors.shadowGrey,
                    offset: Offset(0, 3),
                    blurRadius: 0,
                  ),
                ],
        ),
        child: Center(
          child: Icon(
            widget.icon,
            color: AppColors.textHeading,
            size: 28,
          ),
        ),
      ),
    );
  }
}
