import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class MissionCard extends StatelessWidget {
  const MissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Monthly Mission',
          style: AppTypography.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: AppColors.textHeading,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE5E5E5), width: 1.5),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFD4D4D4),
                offset: Offset(0, 4),
                blurRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get 50 Point Mission',
                style: AppTypography.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: AppColors.textHeading,
                ),
              ),
              const SizedBox(height: 12),
              // Progress Bar
              Container(
                height: 16,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const double progress = 30 / 50;
                    return Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth * progress,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF43F5E), // Rose 500
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Center(
                          child: Text(
                            '30/50',
                            style: AppTypography.textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 10,
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
    );
  }
}
