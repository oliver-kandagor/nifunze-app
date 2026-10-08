import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';

class MatchTheAnimalPage extends StatefulWidget {
  const MatchTheAnimalPage({super.key});

  @override
  State<MatchTheAnimalPage> createState() => _MatchTheAnimalPageState();
}

class _MatchTheAnimalPageState extends State<MatchTheAnimalPage> {
  String? _selectedAnimal;
  String? _selectedFood;
  bool _isChecked = false;
  bool _isWrong = false;
  final Map<String, String> _matches = {}; 

  final Map<String, String> _correctPairs = {
    'Lion': 'Meat',
    'Monkey': 'Banana',
    'Panda': 'Bamboo',
  };

  @override
  Widget build(BuildContext context) {
    bool isComplete = _matches.length == 3;
    bool canCheck = _selectedAnimal != null && _selectedFood != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomTopBar(
        variant: TopBarVariant.progressAndEnergy,
        progress: 0.5,
        energyCount: 25,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ANIMALS QUIZ',
              style: AppTypography.textTheme.labelSmall?.copyWith(
                color: const Color(0xFFA3A3A3),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Match the animal',
              style: AppTypography.textTheme.headlineMedium?.copyWith(
                color: AppColors.textHeading,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 48),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['Lion', 'Monkey', 'Panda'].map((animal) => _buildButton(
                      id: animal,
                      isSelected: _selectedAnimal == animal,
                      isMatched: _matches.containsKey(animal),
                      isWrong: _isChecked && _isWrong && _selectedAnimal == animal,
                      isAnimal: true,
                      onTap: () {
                        if (!_isChecked && !_matches.containsKey(animal)) {
                          setState(() => _selectedAnimal = animal);
                        }
                      },
                    )).toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['Banana', 'Bamboo', 'Meat'].map((food) => _buildButton(
                      id: food,
                      isSelected: _selectedFood == food,
                      isMatched: _matches.containsValue(food),
                      isWrong: _isChecked && _isWrong && _selectedFood == food,
                      isAnimal: false,
                      onTap: () {
                        if (!_isChecked && !_matches.containsValue(food)) {
                          setState(() => _selectedFood = food);
                        }
                      },
                    )).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            GestureDetector(
              onTap: (canCheck || isComplete || _isChecked) ? () {
                if (isComplete) {
                  context.push('/quiz/complete');
                  return;
                }
                if (_isChecked) {
                  setState(() {
                    _isChecked = false;
                    _isWrong = false;
                    _selectedAnimal = null;
                    _selectedFood = null;
                  });
                  return;
                }
                
                setState(() {
                  _isChecked = true;
                  if (_correctPairs[_selectedAnimal] == _selectedFood) {
                    _isWrong = false;
                    _matches[_selectedAnimal!] = _selectedFood!;
                  } else {
                    _isWrong = true;
                  }
                });
              } : null,
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: (canCheck || isComplete || _isChecked) ? const Color(0xFF4CA0FF) : const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border(
                    bottom: BorderSide(
                      color: (canCheck || isComplete || _isChecked) ? const Color(0xFF2C7EE5) : const Color(0xFFD4D4D4),
                      width: 4,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  isComplete ? 'Finish' : (_isChecked ? 'Continue' : 'Check'),
                  style: AppTypography.textTheme.titleMedium?.copyWith(
                    color: (canCheck || isComplete || _isChecked) ? Colors.white : const Color(0xFFA3A3A3),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String id,
    required bool isSelected,
    required bool isMatched,
    required bool isWrong,
    required bool isAnimal,
    required VoidCallback onTap,
  }) {
    Color bgColor = Colors.white;
    Color borderColor = const Color(0xFFE5E5E5);
    Color shadowColor = const Color(0xFFD4D4D4);

    if (isWrong) {
      bgColor = const Color(0xFFFEE2E2);
      borderColor = const Color(0xFFEF4444);
      shadowColor = const Color(0xFFDC2626);
    } else if (isMatched) {
      bgColor = const Color(0xFFDCFCE7);
      borderColor = const Color(0xFF22C55E);
      shadowColor = const Color(0xFF16A34A);
    } else if (isSelected) {
      bgColor = const Color(0xFFDCFCE7);
      borderColor = const Color(0xFF22C55E);
      shadowColor = const Color(0xFF16A34A);
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          id,
          style: AppTypography.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: isWrong ? const Color(0xFFEF4444) : (isSelected || isMatched) ? const Color(0xFF16A34A) : AppColors.textHeading,
          ),
        ),
      ),
    );
  }
}
