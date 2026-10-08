import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';
import '../widgets/qr_code_dialog.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomTopBar(
        variant: TopBarVariant.title,
        title: 'Profile',
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 24.0, bottom: 120.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(context),
            const SizedBox(height: 16),
            _buildActionButtons(context),
            const SizedBox(height: 32),
            _buildOverview(),
            const SizedBox(height: 32),
            _buildMonthlyBadge(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 32, bottom: 24, left: 24, right: 24),
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
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cardGrey,
                ),
                child: ClipOval(
                  child: Image.asset('assets/images/avatar/1.png', // Match avatar from screenshot
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Mike Wheeler',
                style: AppTypography.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textHeading,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '@mike.wheel • Joined since 2019',
                style: AppTypography.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textBody,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat('135', 'Following'),
                  _buildStat('85', 'Follower'),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {
              context.push('/settings');
            },
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderGrey, width: 1.5),
              ),
              child: SvgPicture.asset('assets/icons/Gear.svg', width: 24, height: 24, colorFilter: const ColorFilter.mode(AppColors.textHeading, BlendMode.srcIn)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textHeading,
            height: 1.2,
          ),
        ),
        Text(
          label,
          style: AppTypography.textTheme.bodySmall?.copyWith(
            color: AppColors.textBody,
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                context.push('/follow-friends');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.textHeading,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: AppColors.borderGrey, width: 1.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/UserPlus.svg', width: 20, height: 20, colorFilter: const ColorFilter.mode(AppColors.textHeading, BlendMode.srcIn)),
                  const SizedBox(width: 8),
                  Text(
                    'Follow Friends',
                    style: AppTypography.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          height: 56,
          width: 56,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const QRCodeDialog(
                    name: 'Mike Wheeler', 
                    username: '@mike.wheel • Joined since 2019',
                    avatarUrl: 'assets/images/avatar/1.png',
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.textHeading,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: AppColors.borderGrey, width: 1.5),
              ),
            ),
            child: SvgPicture.asset('assets/icons/SquaresFour.svg', width: 24, height: 24, colorFilter: const ColorFilter.mode(AppColors.textHeading, BlendMode.srcIn)),
          ),
        ),
      ],
    );
  }

  Widget _buildOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OVERVIEW',
          style: AppTypography.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textBody,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildOverviewCard('assets/icons/Fire.svg', '304 Days', AppColors.streakOrange),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildOverviewCard('assets/images/rank/Variant=teal, State=Default.svg', 'Teal', null),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildOverviewCard('assets/icons/Lightning.svg', '42302 XP', const Color(0xFFFBBF24)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverviewCard(String iconPath, String label, Color? iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
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
          SvgPicture.asset(
            iconPath,
            width: 32,
            height: 32,
            colorFilter: iconColor != null ? ColorFilter.mode(iconColor, BlendMode.srcIn) : null,
          ),
          const SizedBox(height: 16),
          Text(
            label,
            style: AppTypography.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textHeading,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyBadge(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MONTHLY BADGE',
                style: AppTypography.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textBody,
                  letterSpacing: 1.2,
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textBody),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: [
              _buildBadgeItem('assets/images/rank/Variant=gray, State=Default.svg'),
              const SizedBox(width: 16),
              _buildBadgeItem('assets/images/rank/Variant=yellow, State=Default.svg'),
              const SizedBox(width: 16),
              _buildBadgeItem('assets/images/rank/Variant=amber, State=Default.svg'),
              const SizedBox(width: 16),
              _buildBadgeItem('assets/images/rank/Variant=orange, State=Default.svg'),
              const SizedBox(width: 16),
              _buildBadgeItem('assets/images/rank/Variant=red, State=Default.svg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBadgeItem(String imagePath) {
    return SvgPicture.asset(
      imagePath,
      width: 80,
      height: 80,
    );
  }
}
