import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({super.key});

  String _getSubtitle(int index) {
    switch (index) {
      case 0:
      case 1:
        return '🧮 Math';
      case 2:
        return '🔠 Alphabet';
      case 3:
        return '🐶 Animals';
      default:
        return '🌈 Colors';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Blue Header part
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20, bottom: 40),
          decoration: const BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Liga Amber',
                style: AppTypography.textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '14 Days',
                  style: AppTypography.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Shields Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/images/rank/Variant=yellow, State=Default.svg', height: 48),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/images/rank/Variant=amber, State=Default.svg', height: 48),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/images/rank/Variant=orange, State=Default.svg', height: 72),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/images/rank/Variant=red, State=Default.svg', height: 48),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset('assets/images/rank/Variant=green, State=Default.svg', height: 48),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Leaderboard List
        Expanded(
          child: Container(
            transform: Matrix4.translationValues(0, -20, 0),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 120),
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(color: AppColors.borderGrey),
              itemBuilder: (context, index) {
                final isCurrentUser = index == 1;
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isCurrentUser ? AppColors.correctGreen.withValues(alpha: 0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    border: isCurrentUser ? Border.all(color: AppColors.correctGreen, width: 1.5) : null,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24,
                        child: Text(
                          '${index + 1}',
                          textAlign: TextAlign.center,
                          style: AppTypography.textTheme.titleLarge?.copyWith(
                            color: isCurrentUser ? AppColors.correctGreen : AppColors.textHeading,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assets/images/avatar/${index + 1}.png'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: AppTypography.textTheme.bodyLarge?.copyWith(
                                color: AppColors.textHeading,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _getSubtitle(index),
                              style: AppTypography.textTheme.bodySmall?.copyWith(
                                color: AppColors.textBody,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '121 XP',
                        style: AppTypography.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textHeading,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
