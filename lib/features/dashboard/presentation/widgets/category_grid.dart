import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 15,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1.25,
        children: const [
          _CategoryCard(
            title: 'Math',
            iconPath: 'assets/icons/Calculator.svg',
            backgroundColor: Color(0xFFCCE4FF),
            shadowColor: Color(0xFF99C7FF),
          ),
          _CategoryCard(
            title: 'Alphabet',
            iconPath: 'assets/icons/TextAa.svg', // Will update later if there is a better icon
            backgroundColor: Color(0xFFD6F5D6),
            shadowColor: Color(0xFFA3E6A3),
          ),
          _CategoryCard(
            title: 'Animals',
            iconPath: 'assets/icons/Cat.svg',
            backgroundColor: Color(0xFFFFE0B2),
            shadowColor: Color(0xFFFFC266),
          ),
          _CategoryCard(
            title: 'Knowledge',
            iconPath: 'assets/icons/Planet.svg',
            backgroundColor: Color(0xFFE6D9FF),
            shadowColor: Color(0xFFCCB3FF),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color backgroundColor;
  final Color shadowColor;

  const _CategoryCard({
    required this.title,
    required this.iconPath,
    required this.backgroundColor,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/learning/${title.toLowerCase()}');
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: shadowColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 36,
              height: 36,
              colorFilter: const ColorFilter.mode(AppColors.textHeading, BlendMode.srcIn),
            ),
            Text(
              title,
              style: AppTypography.textTheme.titleMedium?.copyWith(
                color: AppColors.textHeading,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
