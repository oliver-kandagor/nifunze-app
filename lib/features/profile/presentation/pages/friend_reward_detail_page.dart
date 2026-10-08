import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';

class FriendRewardDetailPage extends StatelessWidget {
  const FriendRewardDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomTopBar(
        variant: TopBarVariant.title,
        title: 'Reward',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBadge('Gray', 'gray', true),
                _buildBadge('Yellow', 'yellow', true),
                _buildBadge('Amber', 'amber', true),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBadge('Orange', 'orange', true),
                _buildBadge('Red', 'red', true),
                _buildBadge('Lime', 'lime', true),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBadge('Green', 'green', true),
                _buildBadge('Emerald', 'emerald', true),
                _buildBadge('Teal', 'teal', false),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBadge('Cyan', 'cyan', false),
                _buildBadge('Sky', 'sky', false),
                _buildBadge('Blue', 'blue', false),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBadge('Indigo', 'indigo', false),
                _buildBadge('Violet', 'violet', false),
                _buildBadge('Purple', 'purple', false),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBadge('fuchisia', 'fuchisia', false),
                _buildBadge('Pink', 'pink', false),
                _buildBadge('Rose', 'rose', false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String name, String variant, bool unlocked) {
    final state = unlocked ? 'Default' : 'Disable';
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/rank/Variant=$variant, State=$state.svg',
          width: 80,
          height: 80,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: AppTypography.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: unlocked ? AppColors.textHeading : AppColors.textBody,
          ),
        ),
      ],
    );
  }
}
