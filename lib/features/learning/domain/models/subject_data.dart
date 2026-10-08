import 'package:flutter/material.dart';
import 'lesson_model.dart';

class SubjectData {
  static final Map<String, Map<String, dynamic>> subjects = {
    'math': {
      'subjectName': 'Math',
      'subjectDescription': 'It is a long established fact that a reader will be distracted by the readable content of a page when look...',
      'iconPath': 'assets/icons/Calculator.svg',
      'subjectColor': const Color(0xFFCCE4FF),
      'progressColor': const Color(0xFF3B82F6),
      'progress': 0.6,
      'lessons': [
        const LessonModel(sectionTitle: 'SECTION 1', title: 'Counting', isLocked: false, buttonColor: Color(0xFF3B82F6), buttonShadowColor: Color(0xFF2563EB), iconColor: Colors.white, routePath: '/quiz/counting'),
        const LessonModel(sectionTitle: 'SECTION 2', title: 'Addition', isLocked: false, buttonColor: Color(0xFF10B981), buttonShadowColor: Color(0xFF059669), iconColor: Colors.white, routePath: '/quiz/addition'),
        const LessonModel(sectionTitle: 'SECTION 3', title: 'Subtraction', isLocked: false, buttonColor: Color(0xFFF59E0B), buttonShadowColor: Color(0xFFD97706), iconColor: Colors.white, routePath: '/quiz/subtraction'),
        const LessonModel(sectionTitle: 'SECTION 4', title: 'Fill The Gap', isLocked: false, buttonColor: Color(0xFFF472B6), buttonShadowColor: Color(0xFFDB2777), iconColor: Colors.white, routePath: '/quiz/fill-the-gap'),
        const LessonModel(sectionTitle: 'SECTION 5', title: 'Greater or Less', isLocked: false, buttonColor: Color(0xFFA78BFA), buttonShadowColor: Color(0xFF7C3AED), iconColor: Colors.white, routePath: '/quiz/greater-or-less'),
        const LessonModel(sectionTitle: 'SECTION 6', title: 'Time', isLocked: false, buttonColor: Color(0xFF60A5FA), buttonShadowColor: Color(0xFF2563EB), iconColor: Colors.white, routePath: '/quiz/time'),
        const LessonModel(sectionTitle: 'SECTION 7', title: 'Money', isLocked: false, buttonColor: Color(0xFFFACC15), buttonShadowColor: Color(0xFFEAB308), iconColor: Colors.white, routePath: '/quiz/money'),
      ],
    },
    'alphabet': {
      'subjectName': 'Alphabet',
      'subjectDescription': 'It is a long established fact that a reader will be distracted by the readable content of a page when look...',
      'iconPath': 'assets/icons/TextAa.svg',
      'subjectColor': const Color(0xFFD6F5D6),
      'progressColor': const Color(0xFF22C55E),
      'progress': 0.4,
      'lessons': [
        const LessonModel(sectionTitle: 'SECTION 1', title: 'Alphabet Map', isLocked: false, buttonColor: Color(0xFF22C55E), buttonShadowColor: Color(0xFF16A34A), iconColor: Colors.white, routePath: '/quiz/alphabet-map'),
        const LessonModel(sectionTitle: 'SECTION 2', title: 'Letter of the Day', isLocked: false, buttonColor: Color(0xFF3B82F6), buttonShadowColor: Color(0xFF2563EB), iconColor: Colors.white, routePath: '/quiz/letter-of-the-day'),
        const LessonModel(sectionTitle: 'SECTION 3', title: 'Trace the Letter', isLocked: false, buttonColor: Color(0xFFF59E0B), buttonShadowColor: Color(0xFFD97706), iconColor: Colors.white, routePath: '/quiz/trace-the-letter'),
        const LessonModel(sectionTitle: 'SECTION 4', title: 'Listen & Match', isLocked: false, buttonColor: Color(0xFF8B5CF6), buttonShadowColor: Color(0xFF6D28D9), iconColor: Colors.white, routePath: '/quiz/listen-and-match'),
        const LessonModel(sectionTitle: 'SECTION 5', title: 'What Letter is This', isLocked: false, buttonColor: Color(0xFFEC4899), buttonShadowColor: Color(0xFFBE185D), iconColor: Colors.white, routePath: '/quiz/what-letter-is-this'),
        const LessonModel(sectionTitle: 'SECTION 6', title: 'Match the Letter', isLocked: false, buttonColor: Color(0xFF14B8A6), buttonShadowColor: Color(0xFF0F766E), iconColor: Colors.white, routePath: '/quiz/match-the-letter'),
        const LessonModel(sectionTitle: 'SECTION 7', title: 'Find the Vowel', isLocked: false, buttonColor: Color(0xFFF43F5E), buttonShadowColor: Color(0xFFE11D48), iconColor: Colors.white, routePath: '/quiz/find-the-vowel'),
      ],
    },
    'animals': {
      'subjectName': 'Animals',
      'subjectDescription': 'It is a long established fact that a reader will be distracted by the readable content of a page when look...',
      'iconPath': 'assets/icons/Cat.svg',
      'subjectColor': const Color(0xFFFFE0B2),
      'progressColor': const Color(0xFFEA580C),
      'progress': 0.2,
      'lessons': [
        const LessonModel(sectionTitle: 'SECTION 1', title: 'Animal Kingdom', isLocked: false, buttonColor: Color(0xFFF97316), buttonShadowColor: Color(0xFFC2410C), iconColor: Colors.white, routePath: '/quiz/animal-kingdom'),
        const LessonModel(sectionTitle: 'SECTION 2', title: 'Match it', isLocked: false, buttonColor: Color(0xFF3B82F6), buttonShadowColor: Color(0xFF2563EB), iconColor: Colors.white, routePath: '/quiz/animal-match-it'),
        const LessonModel(sectionTitle: 'SECTION 3', title: 'Find the Sounds', isLocked: false, buttonColor: Color(0xFF10B981), buttonShadowColor: Color(0xFF059669), iconColor: Colors.white, routePath: '/quiz/animal-sounds'),
        const LessonModel(sectionTitle: 'SECTION 4', title: 'Where do I Live', isLocked: false, buttonColor: Color(0xFFF59E0B), buttonShadowColor: Color(0xFFD97706), iconColor: Colors.white, routePath: '/quiz/where-do-i-live'),
        const LessonModel(sectionTitle: 'SECTION 5', title: 'Guess the Animal', isLocked: false, buttonColor: Color(0xFF8B5CF6), buttonShadowColor: Color(0xFF6D28D9), iconColor: Colors.white, routePath: '/quiz/guess-the-animal'),
      ],
    },
    'knowledge': {
      'subjectName': 'Knowledge',
      'subjectDescription': 'It is a long established fact that a reader will be distracted by the readable content of a page when look...',
      'iconPath': 'assets/icons/Planet.svg',
      'subjectColor': const Color(0xFFE6D9FF),
      'progressColor': const Color(0xFF7C3AED),
      'progress': 0.3,
      'lessons': [
        const LessonModel(sectionTitle: 'SECTION 1', title: 'My Body', isLocked: false, buttonColor: Color(0xFF8B5CF6), buttonShadowColor: Color(0xFF6D28D9), iconColor: Colors.white, routePath: '/quiz/my-body'),
        const LessonModel(sectionTitle: 'SECTION 2', title: 'Opposites', isLocked: false, buttonColor: Color(0xFF10B981), buttonShadowColor: Color(0xFF059669), iconColor: Colors.white, routePath: '/quiz/opposites'),
        const LessonModel(sectionTitle: 'SECTION 3', title: 'World Builder', isLocked: false, buttonColor: Color(0xFF3B82F6), buttonShadowColor: Color(0xFF2563EB), iconColor: Colors.white, routePath: '/quiz/world-builder'),
        const LessonModel(sectionTitle: 'SECTION 4', title: 'Word Search', isLocked: false, buttonColor: Color(0xFFF59E0B), buttonShadowColor: Color(0xFFD97706), iconColor: Colors.white, routePath: '/quiz/word-search'),
      ],
    },
  };
}
