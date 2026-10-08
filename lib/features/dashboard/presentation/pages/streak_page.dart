import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';

class StreakPage extends StatelessWidget {
  const StreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomTopBar(
        variant: TopBarVariant.title,
        title: 'Streak',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ExpandedStreakCard(),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'February 2026',
                  style: AppTypography.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textHeading,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.chevron_left, color: AppColors.textHeading),
                    const SizedBox(width: 16),
                    const Icon(Icons.chevron_right, color: AppColors.textHeading),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const _CalendarCard(),
          ],
        ),
      ),
    );
  }
}

class _ExpandedStreakCard extends StatelessWidget {
  const _ExpandedStreakCard();

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
                      fontSize: 40,
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
                width: 40,
                height: 40,
                colorFilter: const ColorFilter.mode(AppColors.streakOrange, BlendMode.srcIn),
              ),
            ],
          ),
          const SizedBox(height: 24),
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
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderGrey, width: 1.5),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Fire.svg',
                  width: 32,
                  height: 32,
                  colorFilter: const ColorFilter.mode(AppColors.streakOrange, BlendMode.srcIn),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: AppTypography.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textHeading,
                        fontWeight: FontWeight.w600,
                      ),
                      children: const [
                        TextSpan(text: 'Keep your '),
                        TextSpan(
                          text: 'Perfect Streak',
                          style: TextStyle(color: AppColors.streakOrange, fontWeight: FontWeight.w800),
                        ),
                        TextSpan(text: ' by\ndoing a lesson every day!'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Streak Goals',
            style: AppTypography.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textHeading,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildGoalCalendar(60),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.cardGrey,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderGrey, width: 1),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 4 / 30, // Just a visual guess (4 out of 30 days towards 90)
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF472B6), // Pink
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _buildGoalCalendar(90),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGoalCalendar(int days) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/CalendarBlank.svg',
          width: 32,
          height: 32,
          colorFilter: const ColorFilter.mode(AppColors.streakOrange, BlendMode.srcIn),
        ),
        Positioned(
          top: 14,
          child: Text(
            days.toString(),
            style: AppTypography.textTheme.labelSmall?.copyWith(
              color: AppColors.streakOrange,
              fontWeight: FontWeight.w800,
              fontSize: 10,
            ),
          ),
        ),
      ],
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

class _CalendarCard extends StatelessWidget {
  const _CalendarCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '10',
                    style: AppTypography.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textHeading,
                      fontSize: 40,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Days Practiced',
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
                width: 40,
                height: 40,
                colorFilter: const ColorFilter.mode(AppColors.streakOrange, BlendMode.srcIn),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Days of week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['Su', 'Mo', 'Tu', 'Wed', 'Thu', 'Fri', 'Sat'].map((day) {
              return Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: AppTypography.textTheme.bodySmall?.copyWith(
                      color: AppColors.textHeading,
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          // Calendar Grid
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    return Column(
      children: [
        // Week 1: 1 to 7 (Full streak)
        Container(
          height: 36,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF97316), Color(0xFFFB923C)], // Orange gradient
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: List.generate(7, (index) {
              return Expanded(
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 12),
        // Week 2: 8 to 14 (Streak for 8, 9, 10. 10 is highlighted)
        SizedBox(
          height: 36,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final cellWidth = constraints.maxWidth / 7;
              return Stack(
                children: [
                  // Background for streak 8-10
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: cellWidth * 3, // spans 3 days
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFB923C), Color(0xFFEA580C)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(7, (index) {
                      final date = index + 8;
                      final isStreak = date <= 10;
                      final isToday = date == 10;
                      
                      return Expanded(
                        child: Center(
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: isToday ? const BoxDecoration(
                              color: Color(0xFFEA580C), // Darker orange
                              shape: BoxShape.circle,
                            ) : null,
                            alignment: Alignment.center,
                            child: Text(
                              '$date',
                              style: AppTypography.textTheme.bodyMedium?.copyWith(
                                color: isStreak ? Colors.white : AppColors.textHeading,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            }
          ),
        ),
        const SizedBox(height: 12),
        // Week 3: 15 to 21
        SizedBox(
          height: 36,
          child: Row(
            children: List.generate(7, (index) {
              return Expanded(
                child: Center(
                  child: Text(
                    '${index + 15}',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textHeading,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 12),
        // Week 4: 22 to 28
        SizedBox(
          height: 36,
          child: Row(
            children: List.generate(7, (index) {
              return Expanded(
                child: Center(
                  child: Text(
                    '${index + 22}',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textHeading,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 12),
        // Next month (greyed out)
        SizedBox(
          height: 36,
          child: Row(
            children: List.generate(7, (index) {
              return Expanded(
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textBody.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
