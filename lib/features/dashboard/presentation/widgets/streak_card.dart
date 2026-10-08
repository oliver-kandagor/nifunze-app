import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderGrey, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowGrey,
            offset: Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '64',
                    style: AppTypography.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textHeading,
                      fontSize: 56,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Days Streak',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textBody,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/icons/Fire.svg',
                width: 32,
                height: 32,
                colorFilter: const ColorFilter.mode(AppColors.streakOrange, BlendMode.srcIn),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDayCircle('Su', isCompleted: true),
              _buildDayCircle('Mo', isCompleted: true),
              _buildDayCircle('Tu', isCompleted: true),
              _buildDayCircle('We', isCurrent: true, date: '19'),
              _buildDayCircle('Th'),
              _buildDayCircle('Fri'),
              _buildDayCircle('Sa'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayCircle(String day, {bool isCompleted = false, bool isCurrent = false, String? date}) {
    return Column(
      children: [
        Text(
          day,
          style: AppTypography.textTheme.bodySmall?.copyWith(
            color: AppColors.textHeading,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        if (isCompleted)
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.streakOrange,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.streakOrange.withValues(alpha: 0.6),
                  offset: const Offset(0, 3),
                  blurRadius: 0,
                )
              ],
            ),
            child: const Icon(Icons.check_rounded, color: Colors.white, size: 20),
          )
        else if (isCurrent)
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.streakOrange, width: 2),
            ),
            child: Text(
              date ?? '',
              style: AppTypography.textTheme.bodyMedium?.copyWith(
                color: AppColors.textHeading,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          )
        else
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.cardGrey,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderGrey, width: 1.5),
            ),
          ),
      ],
    );
  }
}
