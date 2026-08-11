import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/divider_with_text.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/social_button_row.dart';
import '../../models/user_type.dart';
import '../register/register_screen.dart';
import '../wholesale/wholesale_home_screen.dart';

class LoginScreen extends StatefulWidget {
  final UserType userType;

  const LoginScreen({
    super.key,
    this.userType = UserType.retail,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ResponsiveBuilder(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        
                        // Top Back Button
                        const CustomBackButton(),
                        
                        const SizedBox(height: 28),

                        // Title
                        Text(
                          'Welcome back! Glad\nto see you, Again!',
                          style: AppTypography.headingTitle,
                        ),

                        const SizedBox(height: 32),

                        // Email Field
                        CustomTextField(
                          hintText: 'Enter your email',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 15),

                        // Password Field
                        CustomTextField(
                          hintText: 'Enter your password',
                          controller: _passwordController,
                          isPassword: true,
                        ),

                        const SizedBox(height: 15),

                        // Forgot Password Link
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              // Forgot Password handler
                            },
                            child: Text(
                              'Forgot Password?',
                              style: AppTypography.linkDark,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Login Button
                        PrimaryButton(
                          text: 'Login',
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const WholesaleHomeScreen(),
                              ),
                              (route) => false,
                            );
                          },
                        ),

                        const SizedBox(height: 35),

                        // Or Login with Divider
                        const DividerWithText(text: 'Or Login with'),

                        const SizedBox(height: 22),

                        // Social Buttons
                        const SocialButtonRow(),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

                // Bottom Navigation Link
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: AppTypography.inputHint.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RegisterScreen(userType: widget.userType),
                            ),
                          );
                        },
                        child: Text(
                          'Register Now',
                          style: AppTypography.linkCyan,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
