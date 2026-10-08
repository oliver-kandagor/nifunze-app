import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../widgets/streak_card.dart';
import '../widgets/category_grid.dart';
import '../widgets/mission_card.dart';
import '../widgets/leaderboard_preview.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 70, // Reduced from 100
        bottom: 90, // Reduced from 120
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Hi, Kanda!',
                style: AppTypography.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textHeading,
                  fontSize: 36,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                'assets/icons/HandWaving.svg',
                width: 36,
                height: 36,
                colorFilter: const ColorFilter.mode(Color(0xFFFACC15), BlendMode.srcIn),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'What do you want to learn today?',
            style: AppTypography.textTheme.bodyLarge?.copyWith(
              color: AppColors.textBody,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          const StreakCard(),
          const SizedBox(height: 16),
          const CategoryGrid(),
          const SizedBox(height: 20),
          const MissionCard(),
          const SizedBox(height: 20),
          const LeaderboardPreview(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
