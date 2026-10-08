import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../widgets/primary_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_back_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  const SizedBox(width: 16),
                  Text(
                    'Forgot Password',
                    style: AppTypography.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const CustomTextField(
                label: 'Email',
                hintText: 'Enter your email address',
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your email address to receive a link to reset your password',
                style: AppTypography.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textBody,
                ),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Next',
                onPressed: () {
                  context.push('/reset-password');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
