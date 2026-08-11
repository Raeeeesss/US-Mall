import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'navigation/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const USmallApp());
}

class USmallApp extends StatelessWidget {
  const USmallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'US Mall Business',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.welcome,
      routes: AppRoutes.routes,
    );
  }
}
