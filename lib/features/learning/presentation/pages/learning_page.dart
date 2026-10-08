import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';
import '../../../dashboard/presentation/widgets/lesson_card.dart';
import '../../domain/models/lesson_model.dart';

class LearningPage extends StatelessWidget {
  final String subjectName;
  final String subjectDescription;
  final String iconPath;
  final Color subjectColor;
  final Color progressColor;
  final double progress; // 0.0 to 1.0
  final List<LessonModel> lessons;

  const LearningPage({
    super.key,
    required this.subjectName,
    required this.subjectDescription,
    required this.iconPath,
    required this.subjectColor,
    required this.progressColor,
    required this.progress,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // App background seems white in screenshot
      appBar: CustomTopBar(
        variant: TopBarVariant.backAndStats,
        backgroundColor: subjectColor,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Curved Bottom
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
              decoration: BoxDecoration(
                color: subjectColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subjectName,
                              style: AppTypography.textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: AppColors.textHeading,
                                fontSize: 32,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              subjectDescription,
                              style: AppTypography.textTheme.bodySmall?.copyWith(
                                color: AppColors.textHeading.withValues(alpha: 0.6),
                                fontSize: 10,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Illustration
                      Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          iconPath,
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Progress Bar
                  Container(
                    height: 14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: progressColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          children: [
                            const Expanded(child: SizedBox()),
                            Container(
                              height: 4,
                              decoration: const BoxDecoration(
                                color: Color(0xFF2563EB), // Darker blue shadow
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Lessons List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              itemCount: lessons.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                return GestureDetector(
                  onTap: () {
                    if (!lesson.isLocked) {
                      if (lesson.routePath != null) {
                        context.push(lesson.routePath!);
                      } else {
                        context.push('/quiz/counting'); // Fallback
                      }
                    }
                  },
                  behavior: HitTestBehavior.opaque,
                  child: LessonCard(
                    sectionTitle: lesson.sectionTitle,
                    title: lesson.title,
                    buttonColor: lesson.buttonColor ?? Colors.grey,
                    buttonShadowColor: lesson.buttonShadowColor ?? Colors.grey,
                    iconPath: 'assets/icons/Play.svg',
                    iconColor: lesson.iconColor ?? Colors.black,
                    isLocked: lesson.isLocked,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
