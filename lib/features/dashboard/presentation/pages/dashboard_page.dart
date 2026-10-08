import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_top_bar.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import 'home_tab.dart';
import 'reward_tab.dart';
import 'leaderboard_tab.dart';
import '../../../profile/presentation/pages/profile_tab.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const RewardTab(),
    const LeaderboardTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.background,
      appBar: _selectedIndex == 1 || _selectedIndex == 2 || _selectedIndex == 3 
        ? null // Assuming other tabs will handle their own top bars like RewardTab, or we can just say _selectedIndex != 0
        : const CustomTopBar(
            fireCount: 30,
            coinCount: 213,
            energyCount: 25,
          ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

