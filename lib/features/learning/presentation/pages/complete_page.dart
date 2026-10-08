import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              const SizedBox(height: 48),
              SvgPicture.asset(
                'assets/icons/Confetti.svg',
                width: 160,
                height: 160,
              ),
              const SizedBox(height: 48),
              Text(
                'Flawless',
                style: AppTypography.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textHeading,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'You arrived so quickly that I was left\nspeechless!',
                textAlign: TextAlign.center,
                style: AppTypography.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textBody.withValues(alpha: 0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              
              // Badges
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Badge(title: 'TOTAL XP', value: '29', icon: Icons.bolt, color: const Color(0xFFFACC15), darkColor: const Color(0xFFEAB308)),
                  const SizedBox(width: 16),
                  _Badge(title: 'GREAT', value: '90%', icon: Icons.gps_fixed, color: const Color(0xFF22C55E), darkColor: const Color(0xFF16A34A)),
                  const SizedBox(width: 16),
                  _Badge(title: 'FAST', value: '1:42', icon: Icons.access_time, color: const Color(0xFF3B82F6), darkColor: const Color(0xFF2563EB)),
                ],
              ),
              
              const Spacer(),
              
              // Bottom Action
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE5E5E5), width: 1.5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFD4D4D4),
                          offset: Offset(0, 4),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.ios_share, color: Colors.black, size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.go('/'); // go home
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CA0FF),
                          borderRadius: BorderRadius.circular(16),
                          border: const Border(
                            bottom: BorderSide(
                              color: Color(0xFF2C7EE5),
                              width: 4,
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Claim XP',
                          style: AppTypography.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final Color darkColor;

  const _Badge({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.darkColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 14),
                const SizedBox(width: 4),
                Text(
                  value,
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
