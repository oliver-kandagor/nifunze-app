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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Please fill in both fields');
      }

      await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created! Please sign in.'),
            backgroundColor: AppColors.correctGreen,
          ),
        );
        context.pushReplacement('/signin');
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
                          'Create Your Account',
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
                      text: 'Sign up With Google',
                      icon: const Icon(Icons.g_mobiledata, color: Colors.red, size: 32),
                      onPressed: () {},
                    ),
                    SocialAuthButton(
                      text: 'Sign up with Apple',
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
                            text: 'Sign Up',
                            onPressed: _signUp,
                          ),
                    const SizedBox(height: 24),
                    Center(
                      child: GestureDetector(
                        onTap: () => context.pushReplacement('/signin'),
                        child: RichText(
                          text: TextSpan(
                            text: 'Have an Account? ',
                            style: AppTypography.textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: AppTypography.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
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
