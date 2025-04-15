import 'package:flutter/material.dart';

// Classes abstratas não geram instâncias, mas apenas fornecem informações
abstract class AppColors {
  // static gera ganho de performance pois disponibiliza o dado desde o start da aplicação
  static const Color backgroundColor = Color(0xff202123);
  static const Color lightBackgroundColor = Color(0xff343541);
  static const Color mainColor = Color(0xffffa559);
}
