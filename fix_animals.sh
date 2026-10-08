sed -i '' -e 's/static Widget _buildLionFace()/static Widget buildLionFace()/g' lib/features/learning/presentation/pages/animals_quiz_pages.dart
sed -i '' -e 's/content: _buildLionFace(),/content: buildLionFace(),/g' lib/features/learning/presentation/pages/animals_quiz_pages.dart
sed -i '' -e 's/child: _buildLionFace(),/child: buildLionFace(),/g' lib/features/learning/presentation/pages/animals_quiz_pages.dart
sed -i '' -e 's/path: '\/quiz\/animal-match-it',/path: '\/quiz\/animal-match-it',/g' lib/features/learning/presentation/pages/animals_quiz_pages.dart
