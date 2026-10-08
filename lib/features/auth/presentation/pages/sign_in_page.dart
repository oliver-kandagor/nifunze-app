import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_auth_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_back_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Please fill in both fields');
      }

      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      
      if (mounted) {
        context.go('/dashboard');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
            backgroundColor: AppColors.wrongRed,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            color: Colors.black.withValues(alpha: 0.4),
            child: SafeArea(
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
                          'Sign In',
                          style: AppTypography.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 32),
                    SocialAuthButton(
                      text: 'Sign in With Google',
                      icon: const Icon(Icons.g_mobiledata, color: Colors.red, size: 32),
                      onPressed: () {},
                    ),
                    SocialAuthButton(
                      text: 'Sign in with Apple',
                      icon: const Icon(Icons.apple, color: Colors.black),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Text(
                        'OR CONTINUE WITH EMAIL',
                        style: AppTypography.textTheme.bodySmall?.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      label: 'Email',
                      hintText: 'Enter your email address',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: AppColors.textBody,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator(color: Colors.white))
                        : PrimaryButton(
                            text: 'Sign In',
                            onPressed: _signIn,
                          ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.push('/forgot-password');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: AppTypography.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Text(
                        'By signing in to Nifunze, you agree to our Terms\nand Privacy Policy',
                        textAlign: TextAlign.center,
                        style: AppTypography.textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ].animate(interval: 50.ms).fade(duration: 500.ms).slideX(begin: 0.1, curve: Curves.easeOutQuad),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
