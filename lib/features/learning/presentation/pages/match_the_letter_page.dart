import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';

class MatchTheLetterPage extends StatefulWidget {
  const MatchTheLetterPage({super.key});

  @override
  State<MatchTheLetterPage> createState() => _MatchTheLetterPageState();
}

class _MatchTheLetterPageState extends State<MatchTheLetterPage> {
  String? _selectedUpper;
  String? _selectedLower;
  bool _isChecked = false;
  bool _isWrong = false;
  final Map<String, String> _matches = {}; // maps upper to lower if successfully matched

  @override
  Widget build(BuildContext context) {
    bool isComplete = _matches.length == 3;
    bool canCheck = _selectedUpper != null && _selectedLower != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomTopBar(
        variant: TopBarVariant.progressAndEnergy,
        progress: 0.25,
        energyCount: 25,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connect The Letter',
              style: AppTypography.textTheme.labelSmall?.copyWith(
                color: const Color(0xFFA3A3A3),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Match Upper & Lower',
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
                  // Upper column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['A', 'B', 'C'].map((letter) => _buildButton(
                      letter: letter,
                      isSelected: _selectedUpper == letter,
                      isMatched: _matches.containsKey(letter),
                      isWrong: _isChecked && _isWrong && _selectedUpper == letter,
                      onTap: () {
                        if (!_isChecked && !_matches.containsKey(letter)) {
                          setState(() => _selectedUpper = letter);
                        }
                      },
                    )).toList(),
                  ),
                  // Lower column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['b', 'c', 'a'].map((letter) => _buildButton(
                      letter: letter,
                      isSelected: _selectedLower == letter,
                      isMatched: _matches.containsValue(letter),
                      isWrong: _isChecked && _isWrong && _selectedLower == letter,
                      onTap: () {
                        if (!_isChecked && !_matches.containsValue(letter)) {
                          setState(() => _selectedLower = letter);
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
                  // Reset wrong state and continue
                  setState(() {
                    _isChecked = false;
                    _isWrong = false;
                    _selectedUpper = null;
                    _selectedLower = null;
                  });
                  return;
                }
                
                // Perform check
                setState(() {
                  _isChecked = true;
                  if (_selectedUpper!.toLowerCase() == _selectedLower) {
                    _isWrong = false;
                    _matches[_selectedUpper!] = _selectedLower!;
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
    required String letter,
    required bool isSelected,
    required bool isMatched,
    required bool isWrong,
    required VoidCallback onTap,
  }) {
    Color bgColor = Colors.white;
    Color borderColor = const Color(0xFFE5E5E5);
    Color shadowColor = const Color(0xFFD4D4D4);
    Color textColor = AppColors.textHeading;

    if (isWrong) {
      bgColor = const Color(0xFFFEE2E2);
      borderColor = const Color(0xFFEF4444);
      shadowColor = const Color(0xFFDC2626);
      textColor = const Color(0xFFEF4444);
    } else if (isMatched) {
      bgColor = const Color(0xFFDCFCE7);
      borderColor = const Color(0xFF22C55E);
      shadowColor = const Color(0xFF16A34A);
      textColor = const Color(0xFF16A34A);
    } else if (isSelected) {
      bgColor = const Color(0xFFDCFCE7);
      borderColor = const Color(0xFF22C55E);
      shadowColor = const Color(0xFF16A34A);
      textColor = const Color(0xFF16A34A);
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 140,
        height: 72,
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
          letter,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
