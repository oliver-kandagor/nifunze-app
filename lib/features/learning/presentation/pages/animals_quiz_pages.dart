import 'match_the_animal_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'quiz_page.dart';

class AnimalsQuizPages {
  static GoRoute guessTheAnimalRoute() {
    return GoRoute(
      path: '/quiz/guess-the-animal',
      builder: (context, state) => QuizPage(
        title: 'ANIMALS QUIZ',
        question: 'What animal is this?',
        content: buildLionFace(),
        options: const ['Lion', 'Tiger', 'Bear', 'Wolf'],
        correctAnswer: 'Lion',
      ),
    );
  }

  static GoRoute whereDoILiveRoute() {
    return GoRoute(
      path: '/quiz/where-do-i-live',
      builder: (context, state) => QuizPage(
        title: 'ANIMALS QUIZ',
        question: 'Where does this animal live?',
        content: _buildFishShape(),
        options: const ['Ocean', 'Desert', 'Forest', 'Mountain'],
        correctAnswer: 'Ocean',
      ),
    );
  }

  static GoRoute matchItRoute() {
    return GoRoute(
      path: '/quiz/animal-match-it',
      builder: (context, state) => const MatchTheAnimalPage(),
    );
  }

  static GoRoute animalKingdomRoute() {
    return GoRoute(
      path: '/quiz/animal-kingdom',
      builder: (context, state) => QuizPage(
        title: 'ANIMALS QUIZ',
        question: 'Which one is a Mammal?',
        content: _buildKingdomVisual(),
        options: const ['Snake', 'Eagle', 'Dolphin', 'Frog'],
        correctAnswer: 'Dolphin',
      ),
    );
  }

  static GoRoute findTheSoundsRoute() {
    return GoRoute(
      path: '/quiz/animal-sounds',
      builder: (context, state) => QuizPage(
        title: 'ANIMALS QUIZ',
        question: 'Which animal makes this sound?',
        content: _buildSpeakerVisual(),
        options: const ['Roar', 'Meow', 'Bark', 'Moo'],
        correctAnswer: 'Roar',
      ),
    );
  }

  static Widget buildLionFace() {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        color: Color(0xFFFBBF24),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(
              color: Color(0xFFD97706),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFFDE68A),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 40,
            left: 50,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 50,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: Container(
              width: 16,
              height: 12,
              decoration: BoxDecoration(
                color: const Color(0xFF451A03),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildFishShape() {
    return SizedBox(
      width: 160,
      height: 100,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 25,
            child: Transform.rotate(
              angle: 0.785,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFF3B82F6),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF60A5FA),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 30,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  static Widget _buildKingdomVisual() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF10B981),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF059669), width: 8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 80, height: 80, decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle)),
          Container(width: 40, height: 40, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
        ],
      ),
    );
  }

  static Widget _buildSpeakerVisual() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipPath(
          clipper: _SpeakerClipper(),
          child: Container(
            width: 80,
            height: 80,
            color: const Color(0xFF6366F1),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 8, height: 20, decoration: BoxDecoration(color: const Color(0xFF818CF8), borderRadius: BorderRadius.circular(4))),
            const SizedBox(height: 8),
            Container(width: 8, height: 40, decoration: BoxDecoration(color: const Color(0xFF818CF8), borderRadius: BorderRadius.circular(4))),
            const SizedBox(height: 8),
            Container(width: 8, height: 20, decoration: BoxDecoration(color: const Color(0xFF818CF8), borderRadius: BorderRadius.circular(4))),
          ],
        )
      ],
    );
  }
}

class _SpeakerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.3);
    path.lineTo(size.width * 0.4, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.4, size.height * 0.7);
    path.lineTo(0, size.height * 0.7);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
