import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../auth/presentation/widgets/primary_button.dart';

class LeaderboardPreview extends StatelessWidget {
  const LeaderboardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sapphire League',
          style: AppTypography.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900, fontSize: 20,
            color: AppColors.textHeading,
          ),
        ),
        const SizedBox(height: 12),
        Container(
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
              // Badges
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLeagueBadge('Variant=gray, State=Default.svg', scale: 0.8),
                  _buildLeagueBadge('Variant=yellow, State=Default.svg', scale: 0.8),
                  _buildLeagueBadge('Variant=orange, State=Default.svg', scale: 1.2),
                  _buildLeagueBadge('Variant=red, State=Default.svg', scale: 0.8),
                  _buildLeagueBadge('Variant=rose, State=Default.svg', scale: 0.8),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: AppColors.borderGrey, height: 1),
              const SizedBox(height: 16),
              // Users
              _buildUserRow(rank: 1, name: 'Name', category: 'Math', categoryIcon: 'assets/icons/Calculator.svg', xp: 121, avatarIndex: 1),
              const SizedBox(height: 12),
              _buildUserRow(rank: 2, name: 'Name', category: 'Math', categoryIcon: 'assets/icons/Calculator.svg', xp: 121, isMe: true, avatarIndex: 4),
              const SizedBox(height: 12),
              _buildUserRow(rank: 3, name: 'Name', category: 'Alphabet', categoryIcon: 'assets/icons/TextAa.svg', xp: 121, avatarIndex: 6),
              const SizedBox(height: 12),
              _buildUserRow(rank: 4, name: 'Name', category: 'Animals', categoryIcon: 'assets/icons/Cat.svg', xp: 121, avatarIndex: 7),
              const SizedBox(height: 12),
              _buildUserRow(rank: 5, name: 'Name', category: 'Colors', categoryIcon: 'assets/icons/Rainbow.svg', xp: 121, avatarIndex: 8),
              const SizedBox(height: 24),
              PrimaryButton(
                text: 'See all Leaderboard',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeagueBadge(String path, {double scale = 1.0}) {
    return Transform.scale(
      scale: scale,
      child: SvgPicture.asset(
        'assets/images/rank/$path',
        width: 32,
        height: 32,
      ),
    );
  }

  Widget _buildUserRow({
    required int rank,
    required String name,
    required String category,
    required String categoryIcon,
    required int xp,
    bool isMe = false,
    int avatarIndex = 1,
  }) {
    final bgColor = isMe ? const Color(0xFFDCFCE7) : Colors.transparent;
    final borderColor = isMe ? const Color(0xFF16B364) : Colors.transparent;
    final shadowColor = isMe ? const Color(0xFF16B364) : Colors.transparent;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: isMe
            ? [
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(0, 4),
                  blurRadius: 0,
                )
              ]
            : [],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text(
              rank.toString(),
              style: AppTypography.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w900, fontSize: 20,
                color: AppColors.textHeading,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cardGrey,
            ),
            // Svg avatars seem to exist from 1 to 10
            child: ClipOval(
              child: Image.asset('assets/images/avatar/$avatarIndex.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTypography.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHeading,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      categoryIcon,
                      width: 12,
                      height: 12,
                      colorFilter: const ColorFilter.mode(AppColors.textBody, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      category,
                      style: AppTypography.textTheme.bodySmall?.copyWith(
                        color: AppColors.textBody,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            '$xp XP',
            style: AppTypography.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w900, fontSize: 20,
              color: AppColors.textHeading,
            ),
          ),
        ],
      ),
    );
  }
}
