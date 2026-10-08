import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class RewardTab extends StatelessWidget {
  const RewardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                _buildDailyMission(),
                const SizedBox(height: 32),
                _buildFriendMission(),
                const SizedBox(height: 120), // Padding for bottom nav
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF97316), // Orange
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 24,
        left: 20,
        right: 20,
        bottom: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'March Mission',
            style: AppTypography.textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.schedule, color: Colors.white, size: 16),
              const SizedBox(width: 4),
              Text(
                '14 Days',
                style: AppTypography.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get 50 Point Mission',
                  style: AppTypography.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textHeading,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.cardGrey,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderGrey, width: 1),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: [
                          Container(
                            width: constraints.maxWidth * 0.6, // 30/50
                            decoration: BoxDecoration(
                              color: const Color(0xFFF97316), // Orange
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Center(
                            child: Text(
                              '30/50',
                              style: AppTypography.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyMission() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DAILY MISSION',
                style: AppTypography.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textBody,
                  letterSpacing: 1.2,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.schedule, color: AppColors.textBody, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    '9 H',
                    style: AppTypography.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textBody,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          _DailyTaskRow(
            title: 'Complete 2 lessons.',
            progressText: '1/2',
            progress: 0.5,
            chestIconPath: 'assets/images/chest_bronze.svg',
          ),
          const SizedBox(height: 24),
          _DailyTaskRow(
            title: 'Finish 5 math exercises.',
            progressText: '1/5',
            progress: 0.2,
            chestIconPath: 'assets/images/chest_silver.svg',
          ),
          const SizedBox(height: 24),
          _DailyTaskRow(
            title: 'Perfectly complete 1 lesson.',
            progressText: '0/1',
            progress: 0.0,
            chestIconPath: 'assets/images/chest_gold.svg',
          ),
        ],
      ),
    );
  }

  Widget _buildFriendMission() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FRIEND MISSION',
            style: AppTypography.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textBody,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Follow new friends to\nform a team.',
            style: AppTypography.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textHeading,
              fontSize: 24,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              children: const [
                _FriendCard(name: 'Liam', avatarId: 1),
                SizedBox(width: 16),
                _FriendCard(name: 'Oliver', avatarId: 4),
                SizedBox(width: 16),
                _FriendCard(name: 'Emma', avatarId: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DailyTaskRow extends StatelessWidget {
  final String title;
  final String progressText;
  final double progress;
  final String chestIconPath;

  const _DailyTaskRow({
    required this.title,
    required this.progressText,
    required this.progress,
    required this.chestIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textHeading,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.cardGrey,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.borderGrey, width: 1),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        if (progress > 0)
                          Container(
                            width: constraints.maxWidth * progress,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF97316), // Orange
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        Center(
                          child: Text(
                            progressText,
                            style: AppTypography.textTheme.labelSmall?.copyWith(
                              color: progress > 0 ? Colors.white : AppColors.textHeading,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        SvgPicture.asset(
          chestIconPath,
          width: 48,
          height: 48,
        ),
      ],
    );
  }
}

class _FriendCard extends StatelessWidget {
  final String name;
  final int avatarId;

  const _FriendCard({
    required this.name,
    required this.avatarId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
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
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cardGrey,
            ),
            child: ClipOval(
              child: Image.asset('assets/images/avatar/$avatarId.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: AppTypography.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textHeading,
            ),
          ),
          const Spacer(),
          // Follow button (using primary button with small height)
          SizedBox(
            height: 32,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                'Follow',
                style: AppTypography.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
