import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_top_bar.dart';

class QuizPage extends StatefulWidget {
  final String title;
  final String question;
  final Widget content;
  final List<String> options;
  final String? correctAnswer;

  const QuizPage({
    super.key,
    required this.title,
    required this.question,
    required this.content,
    required this.options,
    this.correctAnswer,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String? _selectedAnswer;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
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
              widget.title,
              style: AppTypography.textTheme.labelSmall?.copyWith(
                color: const Color(0xFFA3A3A3),
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.question,
              style: AppTypography.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textHeading,
                fontSize: 28,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 48),
            
            // Dynamic Content
            Expanded(
              child: Center(
                child: widget.content,
              ),
            ),
            
            const SizedBox(height: 48),
            
            // Options Grid
            if (widget.options.length == 3)
              Row(
                children: widget.options.map((option) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: option == widget.options.last ? 0 : 16.0,
                      ),
                      child: AspectRatio(
                        aspectRatio: 2.0,
                        child: _buildOptionButton(option),
                      ),
                    ),
                  );
                }).toList(),
              )
            else
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: widget.options.map((option) => _buildOptionButton(option)).toList(),
              ),
            
            const SizedBox(height: 48),
            
            // Check Button
            GestureDetector(
              onTap: _selectedAnswer != null ? () {
                if (!_isChecked && widget.correctAnswer != null) {
                  setState(() {
                    _isChecked = true;
                  });
                } else {
                  context.push('/quiz/complete');
                }
              } : null,
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: _selectedAnswer != null ? const Color(0xFF4CA0FF) : const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedAnswer != null ? const Color(0xFF2C7EE5) : const Color(0xFFD4D4D4),
                      width: 4,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  (_isChecked || widget.correctAnswer == null) ? 'Continue' : 'Check',
                  style: AppTypography.textTheme.titleMedium?.copyWith(
                    color: _selectedAnswer != null ? Colors.white : const Color(0xFFA3A3A3),
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

  Widget _buildOptionButton(String option) {
    final isSelected = _selectedAnswer == option;
    
    Color bgColor = Colors.white;
    Color borderColor = const Color(0xFFE5E5E5);
    Color shadowColor = const Color(0xFFD4D4D4);
    Color textColor = AppColors.textHeading;

    if (isSelected) {
      if (_isChecked && widget.correctAnswer != null && option != widget.correctAnswer) {
        bgColor = const Color(0xFFFEE2E2);
        borderColor = const Color(0xFFEF4444);
        shadowColor = const Color(0xFFDC2626);
        textColor = const Color(0xFFEF4444);
      } else {
        bgColor = const Color(0xFFDCFCE7);
        borderColor = const Color(0xFF22C55E);
        shadowColor = const Color(0xFF16A34A);
        textColor = const Color(0xFF16A34A);
      }
    } else if (_isChecked && widget.correctAnswer != null && option == widget.correctAnswer) {
      // Highlight the correct answer if the user picked wrong
      bgColor = const Color(0xFFDCFCE7);
      borderColor = const Color(0xFF22C55E);
      shadowColor = const Color(0xFF16A34A);
      textColor = const Color(0xFF16A34A);
    }

    return GestureDetector(
      onTap: () {
        if (!_isChecked) {
          setState(() {
            _selectedAnswer = option;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
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
          option,
          style: AppTypography.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
