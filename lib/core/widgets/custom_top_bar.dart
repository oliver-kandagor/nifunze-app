import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../../features/auth/presentation/widgets/custom_back_button.dart';

enum TopBarVariant {
  dashboard,
  title,
  backAndStats,
  titleAndCoin,
  progressAndEnergy,
}

class CustomTopBar extends StatelessWidget implements PreferredSizeWidget {
  final TopBarVariant variant;
  final int fireCount;
  final int coinCount;
  final int energyCount;
  final String? title;
  final double? progress; // 0.0 to 1.0
  final bool showBackButton;
  final Color? backgroundColor;
  final IconData? backIcon;

  const CustomTopBar({
    super.key,
    this.variant = TopBarVariant.dashboard,
    this.fireCount = 46,
    this.coinCount = 8000,
    this.energyCount = 25,
    this.title,
    this.progress,
    this.showBackButton = true,
    this.backgroundColor,
    this.backIcon,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 20,
        right: 20,
        bottom: 16,
      ),
      child: _buildContent(),
    );

    if (variant == TopBarVariant.dashboard) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withValues(alpha: 0.9),
              Colors.white.withValues(alpha: 0.0),
            ],
            stops: const [0.0, 0.7, 1.0],
          ),
        ),
        child: content,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
      ),
      child: content,
    );
  }

  Widget _buildContent() {
    switch (variant) {
      case TopBarVariant.dashboard:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Avatar
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cardGrey,
              ),
              child: ClipOval(
                child: Image.asset('assets/images/avatar/4.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Stats
            Row(
              children: [
                _StatPill(
                  iconPath: 'assets/icons/Fire.svg',
                  iconColor: AppColors.streakOrange,
                  text: fireCount.toString(),
                  textColor: AppColors.streakOrange,
                ),
                const SizedBox(width: 8),
                _StatPill(
                  iconPath: 'assets/icons/Coin.svg',
                  iconColor: AppColors.primaryBlue,
                  text: coinCount.toString(),
                  textColor: AppColors.primaryBlue,
                ),
                const SizedBox(width: 8),
                _StatPill(
                  iconPath: 'assets/icons/BatteryCharging.svg',
                  iconColor: const Color(0xFFF472B6), // Pink color
                  text: energyCount.toString(),
                  textColor: const Color(0xFFF472B6),
                ),
              ],
            ),
          ],
        );

      case TopBarVariant.title:
        return Stack(
          alignment: Alignment.center,
          children: [
            if (showBackButton)
              Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(icon: backIcon ?? Icons.chevron_left),
              ),
            if (title != null)
              Text(
                title!,
                style: AppTypography.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textHeading,
                  fontSize: 20,
                ),
              ),
          ],
        );

      case TopBarVariant.backAndStats:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showBackButton) CustomBackButton(icon: backIcon ?? Icons.chevron_left) else const SizedBox(width: 48),
            Row(
              children: [
                _StatPill(
                  iconPath: 'assets/icons/Fire.svg',
                  iconColor: AppColors.streakOrange,
                  text: fireCount.toString(),
                  textColor: AppColors.streakOrange,
                ),
                const SizedBox(width: 8),
                _StatPill(
                  iconPath: 'assets/icons/BatteryCharging.svg',
                  iconColor: const Color(0xFFF472B6),
                  text: energyCount.toString(),
                  textColor: const Color(0xFFF472B6),
                ),
              ],
            ),
          ],
        );

      case TopBarVariant.titleAndCoin:
        return Stack(
          alignment: Alignment.center,
          children: [
            if (showBackButton)
              Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(icon: backIcon ?? Icons.chevron_left),
              ),
            if (title != null)
              Text(
                title!,
                style: AppTypography.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textHeading,
                  fontSize: 20,
                ),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: _StatPill(
                iconPath: 'assets/icons/Coin.svg',
                iconColor: AppColors.primaryBlue,
                text: coinCount.toString(),
                textColor: AppColors.primaryBlue,
              ),
            ),
          ],
        );

      case TopBarVariant.progressAndEnergy:
        return Row(
          children: [
            if (showBackButton) CustomBackButton(icon: backIcon ?? Icons.chevron_left),
            if (showBackButton) const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress ?? 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF472B6), // Pink
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      children: [
                        const Expanded(child: SizedBox()),
                        Container(
                          height: 4,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE83A92), // Darker pink
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            _StatPill(
              iconPath: 'assets/icons/BatteryCharging.svg',
              iconColor: const Color(0xFFF472B6),
              text: energyCount.toString(),
              textColor: const Color(0xFFF472B6),
            ),
          ],
        );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _StatPill extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String text;
  final Color textColor;

  const _StatPill({
    required this.iconPath,
    required this.iconColor,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGrey, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: AppColors.borderGrey,
            offset: Offset(0, 3),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: AppTypography.textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
