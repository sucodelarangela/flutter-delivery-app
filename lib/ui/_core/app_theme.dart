import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/ui/_core/app_colors.dart';

abstract class AppTheme {
  // Efetuando cópia do tema padrão do Flutter
  // e alterando apenas o que precisarmos
  static ThemeData appTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          } else if (states.contains(WidgetState.pressed)) {
            return const Color.fromARGB(171, 255, 164, 89);
          }
          return AppColors.mainColor;
        }),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
