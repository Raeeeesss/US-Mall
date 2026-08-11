import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_assets.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../models/user_type.dart';
import '../register/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppAssets.mallBg,
              fit: BoxFit.cover,
            ),
          ),

          // Dark Gradient Overlay for optimal visual reference contrast
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.35),
                    Colors.black.withValues(alpha: 0.55),
                    Colors.black.withValues(alpha: 0.75),
                  ],
                ),
              ),
            ),
          ),

          // Responsive Content
          SafeArea(
            child: ResponsiveBuilder(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  children: [
                    const Spacer(flex: 3),

                    // Central Brand Emblem & Title (Smaller & Centered)
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.brandLogo,
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'US Mall Business',
                            textAlign: TextAlign.center,
                            style: AppTypography.welcomeTitle.copyWith(
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(flex: 4),

                    // Account Selection Question
                    Text(
                      'Which account type are you registering for?',
                      textAlign: TextAlign.center,
                      style: AppTypography.headingSub.copyWith(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Two Icon Action Cards (Wholesale & Retail)
                    Row(
                      children: [
                        // Wholesale Icon Card (Black / Dark Slate)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(
                                    userType: UserType.wholesale,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 110,
                              decoration: BoxDecoration(
                                color: AppColors.darkSlate,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.wholesale,
                                    width: 34,
                                    height: 34,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Wholesale',
                                    style: AppTypography.buttonPrimary.copyWith(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Retail Icon Card (White Container with Black Icon & Text)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(
                                    userType: UserType.retail,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 110,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.retail,
                                    width: 34,
                                    height: 34,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.darkSlate,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Retail',
                                    style: AppTypography.buttonSecondary.copyWith(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Guest Link
                    GestureDetector(
                      onTap: () {
                        // Action for guest path if requested
                      },
                      child: Text(
                        'Continue as a guest',
                        style: AppTypography.linkCyan.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.accentCyan,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
