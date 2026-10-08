import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'quiz_page.dart';
import 'match_the_letter_page.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AlphabetQuizPages {
  // 1. Trace the Letter
  static GoRoute traceTheLetterRoute() {
    return GoRoute(
      path: '/quiz/trace-the-letter',
      builder: (context, state) => QuizPage(
        title: "Let's Trace",
        question: 'Trace the letter \'B\'',
        content: Container(
          width: double.infinity,
          height: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: CustomPaint(
            painter: _DashedBorderPainter(),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'B',
                  style: TextStyle(
                    fontSize: 220,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFD6E8FF),
                    height: 1.0,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 110,
                  child: _Dot(),
                ),
                Positioned(
                  bottom: 70,
                  right: 110,
                  child: _Dot(),
                ),
              ],
            ),
          ),
        ),
        options: const ['Done'],
        correctAnswer: 'Done',
      ),
    );
  }

  // 2. Listen & Match
  static GoRoute listenAndMatchRoute() {
    return GoRoute(
      path: '/quiz/listen-and-match',
      builder: (context, state) => QuizPage(
        title: 'ALPHABET',
        question: 'Listen and match the letter',
        content: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: const Color(0xFF4CA0FF),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2C7EE5),
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.volume_up_rounded,
              color: Colors.white,
              size: 64,
            ),
          ),
        ),
        options: const ['A', 'B', 'C', 'D'],
        correctAnswer: 'A',
      ),
    );
  }

  // 3. Alphabet Map
  static GoRoute alphabetMapRoute() {
    return GoRoute(
      path: '/quiz/alphabet-map',
      builder: (context, state) => QuizPage(
        title: 'Alphabet Map',
        question: 'What comes next?',
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['A', 'B', '...', 'D'].map((item) {
            final isDot = item == '...';
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: 72,
                height: 80,
                decoration: BoxDecoration(
                  color: isDot ? Colors.white : const Color(0xFFF472B6), // Pink
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDot ? const Color(0xFFE5E5E5) : const Color(0xFFDB2777),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDot ? const Color(0xFFD4D4D4) : const Color(0xFFDB2777),
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: isDot ? AppColors.textHeading : Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        options: const ['C', 'E', 'F', 'G'],
        correctAnswer: 'C',
      ),
    );
  }

  // 4. Letter of the Day
  static GoRoute letterOfTheDayRoute() {
    return GoRoute(
      path: '/quiz/letter-of-the-day',
      builder: (context, state) => QuizPage(
        title: 'ALPHABET',
        question: 'Letter of the Day',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: const Color(0xFFFFD154),
                borderRadius: BorderRadius.circular(32),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFF59E0B),
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'A',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'A is for Apple',
              style: AppTypography.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textHeading,
              ),
            ),
          ],
        ),
        options: const ['Awesome!'],
        correctAnswer: 'Awesome!',
      ),
    );
  }

  // 5. What Letter is This
  static GoRoute whatLetterIsThisRoute() {
    return GoRoute(
      path: '/quiz/what-letter-is-this',
      builder: (context, state) => QuizPage(
        title: 'Tap the Correct Answer',
        question: 'What Letter is this?',
        content: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE5E5E5), width: 4),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFD4D4D4),
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Mane
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xFFF59E0B),
                  shape: BoxShape.circle,
                ),
              ),
              // Ears
              Positioned(
                top: 35,
                left: 45,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFCD34D),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 35,
                right: 45,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFCD34D),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Face
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFFFDE68A),
                  shape: BoxShape.circle,
                ),
              ),
              // Eyes
              Positioned(
                top: 75,
                left: 65,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1F2937),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 75,
                right: 65,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1F2937),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Nose
              Positioned(
                top: 90,
                child: Container(
                  width: 12,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF92400E),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              // Mouth
              Positioned(
                top: 100,
                child: Container(
                  width: 20,
                  height: 10,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFF92400E), width: 2),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        options: const ['L', 'M', 'A', 'T'],
        correctAnswer: 'L',
      ),
    );
  }

  // 6. Match the Letter
  static GoRoute matchTheLetterRoute() {
    return GoRoute(
      path: '/quiz/match-the-letter',
      builder: (context, state) => const MatchTheLetterPage(),
    );
  }

  // 7. Find the Vowel
  static GoRoute findTheVowelRoute() {
    return GoRoute(
      path: '/quiz/find-the-vowel',
      builder: (context, state) => QuizPage(
        title: 'ALPHABET',
        question: 'Find the vowel',
        content: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFDCFCE7),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFF22C55E), width: 4),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF16A34A),
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                size: 64,
                color: Color(0xFF16A34A),
              ),
              SizedBox(height: 16),
              Text(
                'A E I O U',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF16A34A),
                  letterSpacing: 8,
                ),
              ),
            ],
          ),
        ),
        options: const ['B', 'C', 'E', 'F'],
        correctAnswer: 'E',
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        color: Color(0xFF4CA0FF),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF22C55E)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    final rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(24),
    );

    path.addRRect(rRect);

    final dashWidth = 10.0;
    final dashSpace = 10.0;
    double distance = 0.0;

    for (ui.PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
      distance = 0.0;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
