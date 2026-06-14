import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const ReplayKidsApp());
}

class ReplayKidsApp extends StatelessWidget {
  const ReplayKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReplayKids',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.c500,
          primary: AppColors.c500,
          secondary: AppColors.c300,
        ),
      ),
      home: const LoginPage(),
    );
  }
}