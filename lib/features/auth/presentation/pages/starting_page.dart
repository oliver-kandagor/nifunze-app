import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';


class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Container(
            color: Colors.black.withValues(alpha: 0.3),
            child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 400,
                    height: 400,
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    'Nifunze',
                    style: GoogleFonts.chewy(
                      fontSize: 48,
                      color: AppColors.correctGreen,
                      shadows: [
                        Shadow(
                          color: Colors.white.withValues(alpha: 0.8),
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                        Shadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                PrimaryButton(
                  text: 'Sign In',
                  onPressed: () {
                    context.push('/signin');
                  },
                ),
                const SizedBox(height: 16),
                SecondaryButton(
                  text: 'Get Started',
                  onPressed: () {
                    context.push('/signup');
                  },
                ),
                const SizedBox(height: 24),
              ].animate(interval: 150.ms).fade(duration: 600.ms).slideY(begin: 0.2, curve: Curves.easeOutQuad),
            ),
          ),
            ),
          ),
        ),
      ),
    );
  }
}
