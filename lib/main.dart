import 'package:flutter/material.dart';
import 'package:projordan/core/theme/app_theme.dart';
import 'package:projordan/presentation/screens/auth/start.dart';

void main() {
  runApp(const RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عقاراتي',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home:StartScreen(),
    );
  }
}

