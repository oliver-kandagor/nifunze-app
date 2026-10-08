import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class LessonCard extends StatelessWidget {
  final String sectionTitle;
  final String title;
  final Color buttonColor;
  final Color buttonShadowColor;
  final String iconPath;
  final Color iconColor;
  final bool isLocked;

  const LessonCard({
    super.key,
    required this.sectionTitle,
    required this.title,
    required this.buttonColor,
    required this.buttonShadowColor,
    required this.iconPath,
    required this.iconColor,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFD4D4D4),
            offset: Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  sectionTitle.toUpperCase(),
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: const Color(0xFFA3A3A3),
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: AppTypography.textTheme.titleMedium?.copyWith(
                    color: isLocked ? const Color(0xFFA3A3A3) : AppColors.textHeading,
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isLocked ? const Color(0xFFE5E5E5) : buttonColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isLocked ? const Color(0xFFD4D4D4) : buttonColor,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: isLocked ? const Color(0xFFD4D4D4) : buttonShadowColor,
                  offset: const Offset(0, 4),
                  blurRadius: 0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              isLocked ? 'assets/icons/Lock.svg' : iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isLocked ? const Color(0xFFA3A3A3) : iconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
