// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
        primaryColor:AppColors.primary, // اللون الأساسي للتطبيق
   inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary,),
        borderRadius: BorderRadius.circular(12),
      ),),
         
    fontFamily: 'Tajawal',
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 14),
    ),
colorScheme: const ColorScheme.light(
  primary: AppColors.primary,
  secondary: AppColors.primary, // حطي لون ثاني متناسق
  background: Colors.white,
  surface: Colors.white,
  onPrimary: Colors.white,
  onSecondary: Color.fromARGB(255, 94, 90, 90),
  onBackground: Color.fromARGB(255, 119, 105, 105),
  onSurface: Color.fromARGB(255, 99, 94, 94),
),

    useMaterial3: true,
  );
}
