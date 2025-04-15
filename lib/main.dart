import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/ui/_core/app_theme.dart';
import 'package:flutter_delivery_app/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

// Atalho `stl`
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.appTheme, home: SplashScreen());
  }
}
