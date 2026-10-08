import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomTopBar(
        variant: TopBarVariant.title,
        title: 'Settings',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: [
                _buildSettingItem('assets/icons/User.svg', 'Profile'),
                const SizedBox(height: 16),
                _buildSettingItem('assets/icons/Gear.svg', 'Preference'),
                const SizedBox(height: 16),
                _buildSettingItem('assets/icons/Bell.svg', 'Notifications'),
                const SizedBox(height: 16),
                _buildSettingItem('assets/icons/Lock.svg', 'Privacy Settings'),
                const SizedBox(height: 16),
                _buildSettingItem('assets/icons/Lock.svg', 'Help Center'), 
                const SizedBox(height: 16),
                _buildSettingItem('assets/icons/Key.svg', 'Privacy Policy'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.textHeading,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: AppColors.borderGrey, width: 2),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/SignOut.svg',
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(AppColors.textHeading, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Log Out',
                      style: AppTypography.textTheme.titleMedium?.copyWith(
                        color: AppColors.textHeading,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String iconPath, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGrey, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowGrey,
            offset: Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(AppColors.textHeading, BlendMode.srcIn),
        ),
        title: Text(
          title,
          style: AppTypography.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textHeading,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textHeading),
        onTap: () {},
      ),
    );
  }
}
