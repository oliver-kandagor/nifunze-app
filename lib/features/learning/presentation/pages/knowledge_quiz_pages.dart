import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';
import 'quiz_page.dart';

class KnowledgeQuizPages {
  static GoRoute myBodyRoute() {
    return GoRoute(
      path: '/quiz/my-body',
      builder: (context, state) => const QuizPage(
        title: 'My Body',
        question: 'What part is this?',
        options: ['Nose', 'Lips', 'Eyes', 'Ear'],
        correctAnswer: 'Eyes',
        content: EyeGraphic(),
      ),
    );
  }

  static GoRoute oppositesRoute() {
    return GoRoute(
      path: '/quiz/opposites',
      builder: (context, state) => const QuizPage(
        title: 'Learn opposite',
        question: 'Opposites',
        options: ['Hot', 'Out', 'Up', 'Small', 'Big', 'Down', 'In', 'Cold'],
        correctAnswer: 'Cold',
        content: SizedBox(height: 16),
      ),
    );
  }

  static GoRoute worldBuilderSpellRoute() {
    return GoRoute(
      path: '/quiz/world-builder',
      builder: (context, state) => const QuizPage(
        title: 'Word Builder',
        question: 'Spell The Word',
        options: [],
        content: SpellTheWordContent(),
      ),
    );
  }

  static GoRoute worldBuilderSearchRoute() {
    return GoRoute(
      path: '/quiz/word-search',
      builder: (context, state) => const QuizPage(
        title: 'Word Search',
        question: 'Find : Cat, Dog, Fish',
        options: [],
        content: WordSearchContent(),
      ),
    );
  }
}

class EyeGraphic extends StatelessWidget {
  const EyeGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        color: const Color(0xFFBBE0FE),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Pink outer
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                width: 160,
                height: 160,
                decoration: const BoxDecoration(
                  color: Color(0xFFF8A1B1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(160),
                    bottomRight: Radius.circular(160),
                  ),
                ),
              ),
            ),
            // White inner
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(130),
                    bottomRight: Radius.circular(130),
                  ),
                ),
              ),
            ),
            // Pupil (brown)
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF4A2511),
                shape: BoxShape.circle,
              ),
            ),
            // Black center
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                shape: BoxShape.circle,
              ),
            ),
            // Reflections
            Positioned(
              top: 90,
              left: 90,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 95,
              right: 95,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpellTheWordContent extends StatelessWidget {
  const SpellTheWordContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Lion Graphic
        const LionGraphic(),
        const SizedBox(height: 32),
        // Target slots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['L', 'I', 'O', 'N'].map((letter) {
            return Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF4CA0FF),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                letter,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 32),
        // Options grid
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: ['L', 'I', 'O', 'A', 'B', 'N', 'P', 'O'].map((letter) {
            final isSelected = ['L', 'I', 'O', 'N'].contains(letter);
            return Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFDCFCE7) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? const Color(0xFF22C55E) : const Color(0xFFE5E5E5),
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                letter,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF16A34A) : const Color(0xFF1A1A1A),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class LionGraphic extends StatelessWidget {
  const LionGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Mane 
          Positioned(
            top: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFA8243),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDF6D30),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Transform.rotate(
              angle: pi / 4,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFA8243), Color(0xFFDF6D30)],
                    stops: [0.5, 0.5],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          // Ears
          Positioned(
            top: 40,
            left: 30,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFE9C496),
              child: CircleAvatar(radius: 10, backgroundColor: const Color(0xFFB89370)),
            ),
          ),
          Positioned(
            top: 40,
            right: 30,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFCBA074),
              child: CircleAvatar(radius: 10, backgroundColor: const Color(0xFF997554)),
            ),
          ),
          // Face
          Positioned(
            top: 50,
            child: Container(
              width: 100,
              height: 90,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE9C496), Color(0xFFCBA074)],
                  stops: [0.5, 0.5],
                ),
                borderRadius: BorderRadius.circular(45),
              ),
            ),
          ),
          // Snout
          Positioned(
            bottom: 30,
            child: Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF4E2C7),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          // Nose
          Positioned(
            bottom: 55,
            child: Container(
              width: 24,
              height: 16,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          // Eyes
          Positioned(
            top: 80,
            left: 60,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 80,
            right: 60,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Smile lines
          Positioned(
            bottom: 40,
            left: 65,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF1A1A1A), width: 3),
                  right: BorderSide(color: Color(0xFF1A1A1A), width: 3),
                ),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 65,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF1A1A1A), width: 3),
                  left: BorderSide(color: Color(0xFF1A1A1A), width: 3),
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)),
              ),
            ),
          ),
          // Center line
          Positioned(
            bottom: 50,
            child: Container(
              width: 3,
              height: 10,
              color: const Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}

class WordSearchContent extends StatelessWidget {
  const WordSearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    final letters = [
      'C', 'A', 'T', 'B', 'A', 'D',
      'Z', 'P', 'Q', 'R', 'E', 'O',
      'M', 'F', 'I', 'S', 'H', 'G',
      'N', 'O', 'P', 'U', 'R', 'S',
      'H', 'I', 'J', 'K', 'L', 'M',
    ];

    final highlighted = {
      0, 1, 2, // C A T
      5, 11, 17, // D O G
      13, 14, 15, 16 // F I S H
    };

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: letters.length,
      itemBuilder: (context, index) {
        final isSelected = highlighted.contains(index);
        return Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFDCFCE7) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? const Color(0xFF22C55E) : const Color(0xFFE5E5E5),
              width: 2,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            letters[index],
            style: TextStyle(
              color: isSelected ? const Color(0xFF16A34A) : const Color(0xFF1A1A1A),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        );
      },
    );
  }
}
