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
import '../login/login_screen.dart';
import '../retail/retail_home_screen.dart';
import '../wholesale/wholesale_home_screen.dart';

class RegisterScreen extends StatefulWidget {
  final UserType userType;

  const RegisterScreen({
    super.key,
    this.userType = UserType.retail,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegistration(BuildContext context) {
    debugPrint('Registering account with role: ${widget.userType.name}');
    if (widget.userType == UserType.wholesale) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WholesaleHomeScreen(),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const RetailHomeScreen(),
        ),
        (route) => false,
      );
    }
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

                        // Dynamic Title based on account type
                        Text(
                          widget.userType == UserType.wholesale
                              ? 'Hello! Register as a\nwholesaler'
                              : 'Hello! Register as a\nretailer',
                          style: AppTypography.headingTitle,
                        ),

                        const SizedBox(height: 32),

                        // Username Field
                        CustomTextField(
                          hintText: 'Username',
                          controller: _usernameController,
                        ),

                        const SizedBox(height: 12),

                        // Email Field
                        CustomTextField(
                          hintText: 'Email',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 12),

                        // Password Field
                        CustomTextField(
                          hintText: 'Password',
                          controller: _passwordController,
                          isPassword: true,
                        ),

                        const SizedBox(height: 12),

                        // Confirm Password Field
                        CustomTextField(
                          hintText: 'Confirm password',
                          controller: _confirmPasswordController,
                          isPassword: true,
                        ),

                        const SizedBox(height: 30),

                        // Register Button
                        PrimaryButton(
                          text: 'Register',
                          onPressed: () => _handleRegistration(context),
                        ),

                        const SizedBox(height: 35),

                        // Or Register with Divider
                        const DividerWithText(text: 'Or Register with'),

                        const SizedBox(height: 22),

                        // Social Buttons
                        SocialButtonRow(
                          onFacebookTap: () => _handleRegistration(context),
                          onGoogleTap: () => _handleRegistration(context),
                          onAppleTap: () => _handleRegistration(context),
                        ),

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
                        'Already have an account? ',
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
                                  LoginScreen(userType: widget.userType),
                            ),
                          );
                        },
                        child: Text(
                          'Login Now',
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
