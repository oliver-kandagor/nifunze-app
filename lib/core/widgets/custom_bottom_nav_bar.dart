import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: 0.0),
            Colors.white.withValues(alpha: 0.9),
            Colors.white,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      padding: EdgeInsets.only(
        top: 24, // Space for the gradient to fade
        bottom: MediaQuery.of(context).padding.bottom == 0 ? 20 : MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavBarItem(
            iconPath: 'assets/icons/House.svg',
            label: 'Home',
            isSelected: selectedIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          _NavBarItem(
            iconPath: 'assets/icons/Medal.svg',
            label: 'Reward',
            isSelected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
          ),
          _NavBarItem(
            iconPath: 'assets/icons/Trophy.svg',
            label: 'Ranking',
            isSelected: selectedIndex == 2,
            onTap: () => onItemSelected(2),
          ),
          _NavBarItem(
            iconPath: 'assets/icons/User.svg',
            label: 'Profile',
            isSelected: selectedIndex == 3,
            onTap: () => onItemSelected(3),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primaryBlue : AppColors.textHeading.withValues(alpha: 0.6);
    final bgColor = isSelected ? const Color(0xFFDBEAFE) : Colors.transparent; // Light blue bg

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: isSelected 
              ? Border.all(color: AppColors.primaryBlue, width: 1.5)
              : Border.all(color: Colors.transparent, width: 1.5),
          boxShadow: isSelected
              ? [
                  const BoxShadow(
                    color: AppColors.primaryBlueDark,
                    offset: Offset(0, 4),
                    blurRadius: 0,
                    spreadRadius: 0,
                  )
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTypography.textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
