import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        context.go('/start');
      }
    });
  }

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
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 250,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.school, // fallback icon
                  size: 80,
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Nifunze',
                style: GoogleFonts.chewy(
                  fontSize: 56,
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
            ].animate(interval: 300.ms).fade(duration: 800.ms).scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutBack),
          ),
          ),
          ),
        ),
      ),
    );
  }
}
