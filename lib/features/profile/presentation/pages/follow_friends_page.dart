import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';

class FollowFriendsPage extends StatelessWidget {
  const FollowFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomTopBar(
        variant: TopBarVariant.title,
        title: 'Find Your Friend',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOptionButton(context, 'assets/icons/AddressBook.svg', 'Choose from Contact', () {
              context.push('/contacts');
            }),
            const SizedBox(height: 16),
            _buildOptionButton(context, 'assets/icons/MagnifyingGlass.svg', 'Find Based on Name', () {}),
            const SizedBox(height: 16),
            _buildOptionButton(context, 'assets/icons/Link.svg', 'Share you link', () {}),
            const SizedBox(height: 32),
            Text(
              'Friends Suggestion',
              style: AppTypography.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFriendSuggestion('Liam', 'assets/images/avatar/5.png', true),
                  const SizedBox(width: 16),
                  _buildFriendSuggestion('Oliver', 'assets/images/avatar/6.png', false),
                  const SizedBox(width: 16),
                  _buildFriendSuggestion('Emma', 'assets/images/avatar/7.png', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendSuggestion(String name, String avatarPath, bool isFollowBack) {
    return Container(
      width: 140,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: AppColors.cardGrey,
            child: ClipOval(
              child: Image.asset(
                avatarPath,
                fit: BoxFit.cover,
                width: 72,
                height: 72,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: AppTypography.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textHeading,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isFollowBack ? const Color(0xFF3B82F6).withValues(alpha: 0.8) : const Color(0xFF3B82F6), // approximated colors
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                isFollowBack ? 'Follow Back' : 'Follow',
                style: AppTypography.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String iconPath, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.borderGrey, width: 1.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: 24, height: 24, colorFilter: const ColorFilter.mode(AppColors.textHeading, BlendMode.srcIn)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: AppTypography.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textHeading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
