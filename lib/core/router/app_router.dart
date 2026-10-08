import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/learning/presentation/widgets/chalkboard_widget.dart';
import '../../features/learning/presentation/widgets/number_box.dart';
import '../../features/learning/presentation/pages/complete_page.dart';
import '../../features/learning/presentation/pages/learning_page.dart';
import '../../features/learning/domain/models/lesson_model.dart';
import '../../features/learning/domain/models/subject_data.dart';
import '../../features/learning/presentation/pages/quiz_page.dart';
import '../../features/learning/presentation/pages/alphabet_quiz_pages.dart';
import '../../features/learning/presentation/pages/animals_quiz_pages.dart';
import '../../features/learning/presentation/pages/knowledge_quiz_pages.dart';

import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/starting_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/profile/presentation/pages/follow_friends_page.dart';
import '../../features/profile/presentation/pages/contact_page.dart';
import '../../features/profile/presentation/pages/settings_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(path: '/start', builder: (context, state) => const StartingPage()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
      GoRoute(path: '/signin', builder: (context, state) => const SignInPage()),
      GoRoute(path: '/forgot-password', builder: (context, state) => const ForgotPasswordPage()),
      GoRoute(path: '/reset-password', builder: (context, state) => const ResetPasswordPage()),
      GoRoute(path: '/dashboard', builder: (context, state) => const DashboardPage()),
      GoRoute(path: '/follow-friends', builder: (context, state) => const FollowFriendsPage()),
      GoRoute(path: '/contacts', builder: (context, state) => const ContactPage()),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsPage()),
      
      GoRoute(
        path: '/learning/:subject',
        builder: (context, state) {
          final subjectParam = state.pathParameters['subject'] ?? 'math';
          final data = SubjectData.subjects[subjectParam] ?? SubjectData.subjects['math']!;
          return LearningPage(
            subjectName: data['subjectName'] as String,
            subjectDescription: data['subjectDescription'] as String,
            iconPath: data['iconPath'] as String,
            subjectColor: data['subjectColor'] as Color,
            progressColor: data['progressColor'] as Color,
            progress: data['progress'] as double,
            lessons: data['lessons'] as List<LessonModel>,
          );
        },
      ),

      // Math Quizzes
      GoRoute(
        path: '/quiz/counting',
        builder: (context, state) => QuizPage(
          title: "Let's Count",
          question: "How many candies are on this screen?",
          options: const ["6", "7", "8", "9"],
          correctAnswer: "6",
          content: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(6, (index) => SvgPicture.asset('assets/images/create-icon-vector-candies- 9.svg', width: 64, height: 64)),
          ),
        ),
      ),
      GoRoute(
        path: '/quiz/addition',
        builder: (context, state) => const QuizPage(
          title: "Addition",
          question: "What is the answer?",
          options: ["8", "9", "10", "11"],
          correctAnswer: "8",
          content: ChalkboardWidget(text: "5 + 3 = ?", color: Color(0xFF063D22), shadowColor: Color(0xFF042816)),
        ),
      ),
      GoRoute(
        path: '/quiz/subtraction',
        builder: (context, state) => const QuizPage(
          title: "Subtraction",
          question: "What is the answer?",
          options: ["2", "3", "4", "5"],
          correctAnswer: "2",
          content: ChalkboardWidget(text: "5 - 3 = ?", color: Color(0xFF202D3D), shadowColor: Color(0xFF121C26)),
        ),
      ),
      GoRoute(
        path: '/quiz/fill-the-gap',
        builder: (context, state) => QuizPage(
          title: "Fill the gap",
          question: "What number comes next?",
          options: const ["7", "8", "9", "10"],
          correctAnswer: "7",
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              NumberBox(text: '5', color: Color(0xFFF472B6), shadowColor: Color(0xFFDB2777), textColor: Colors.white), 
              SizedBox(width: 8), 
              NumberBox(text: '6', color: Color(0xFFF472B6), shadowColor: Color(0xFFDB2777), textColor: Colors.white), 
              SizedBox(width: 8), 
              NumberBox(text: '...', color: Colors.white, shadowColor: Color(0xFFE5E5E5), textColor: Colors.black), 
              SizedBox(width: 8), 
              NumberBox(text: '8', color: Color(0xFFF472B6), shadowColor: Color(0xFFDB2777), textColor: Colors.white),
            ],
          ),
        ),
      ),
      GoRoute(
        path: '/quiz/greater-or-less',
        builder: (context, state) => QuizPage(
          title: "Greater or Less",
          question: "Tap The Right Sign",
          options: const ["<", ">", "="],
          correctAnswer: "<",
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              NumberBox(text: '5', color: Color(0xFF3B82F6), shadowColor: Color(0xFF2563EB), textColor: Colors.white), 
              SizedBox(width: 24), 
              Text('...', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Color(0xFFA3A3A3))), 
              SizedBox(width: 24), 
              NumberBox(text: '8', color: Color(0xFF3B82F6), shadowColor: Color(0xFF2563EB), textColor: Colors.white),
            ],
          ),
        ),
      ),
      GoRoute(
        path: '/quiz/time',
        builder: (context, state) => QuizPage(
          title: "Time",
          question: "What time is it?",
          options: const ["03:00", "12:00", "06:00"],
          correctAnswer: "03:00",
          content: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFF2E384D), width: 8)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(top: 8, child: Text('12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                const Positioned(bottom: 8, child: Text('6', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                const Positioned(left: 8, child: Text('9', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                const Positioned(right: 8, child: Text('3', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                Positioned(top: 96, left: 96, child: Container(width: 4, height: 60, color: Colors.black, transform: Matrix4.translationValues(-2, -60, 0))),
                Positioned(top: 96, left: 96, child: Container(width: 50, height: 4, color: Colors.black, transform: Matrix4.translationValues(0, -2, 0))),
                Positioned(top: 96, left: 96, child: Container(width: 2, height: 60, color: Colors.red, transform: Matrix4.translationValues(-1, 0, 0))),
                Container(width: 12, height: 12, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
      GoRoute(
        path: '/quiz/money',
        builder: (context, state) => QuizPage(
          title: "Count the money",
          question: "How much in total?",
          options: const ["\$15", "\$5", "\$10", "\$20"],
          correctAnswer: "\$15",
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => Container(
              width: 80, height: 80, margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFFFACC15), border: Border.all(color: const Color(0xFFEAB308), width: 6)),
              alignment: Alignment.center,
              child: const Text('\$5', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            )),
          ),
        ),
      ),

      // Alphabet Routes
      AlphabetQuizPages.alphabetMapRoute(),
      AlphabetQuizPages.letterOfTheDayRoute(),
      AlphabetQuizPages.traceTheLetterRoute(),
      AlphabetQuizPages.listenAndMatchRoute(),
      AlphabetQuizPages.whatLetterIsThisRoute(),
      AlphabetQuizPages.matchTheLetterRoute(),
      AlphabetQuizPages.findTheVowelRoute(),

      // Animals Routes
      AnimalsQuizPages.animalKingdomRoute(),
      AnimalsQuizPages.matchItRoute(),
      AnimalsQuizPages.findTheSoundsRoute(),
      AnimalsQuizPages.whereDoILiveRoute(),
      AnimalsQuizPages.guessTheAnimalRoute(),

      // Knowledge Routes
      KnowledgeQuizPages.myBodyRoute(),
      KnowledgeQuizPages.oppositesRoute(),
      KnowledgeQuizPages.worldBuilderSpellRoute(),
      KnowledgeQuizPages.worldBuilderSearchRoute(),

      GoRoute(path: '/quiz/complete', builder: (context, state) => const CompletePage()),
    ],
  );
}
