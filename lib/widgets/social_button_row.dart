import 'package:flutter/material.dart';
import '../core/constants/app_assets.dart';
import 'social_login_button.dart';

class SocialButtonRow extends StatelessWidget {
  final VoidCallback? onFacebookTap;
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  const SocialButtonRow({
    super.key,
    this.onFacebookTap,
    this.onGoogleTap,
    this.onAppleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialLoginButton(
          iconPath: AppAssets.facebook,
          onTap: onFacebookTap ?? () {},
        ),
        const SizedBox(width: 8),
        SocialLoginButton(
          iconPath: AppAssets.google,
          onTap: onGoogleTap ?? () {},
        ),
        const SizedBox(width: 8),
        SocialLoginButton(
          iconPath: AppAssets.apple,
          onTap: onAppleTap ?? () {},
        ),
      ],
    );
  }
}
