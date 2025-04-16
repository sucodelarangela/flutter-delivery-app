import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/data/restaurant_data.dart';
import 'package:flutter_delivery_app/ui/_core/app_theme.dart';
import 'package:flutter_delivery_app/ui/_core/cart_provider.dart';
import 'package:flutter_delivery_app/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // garante que o que é async vai ser executado antes da nossa aplicação

  // Passando o RestaurantData para o resto da aplicação
  // Nesta instância teremos sempre uma lista de restaurantes que será apenas alimentada
  // pelo restaurant_data
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();

  // Provider: Gerenciador de estados que nos permite criar uma fonte única de verdade
  // ChangeNotifierProvider transforma a classe RestaurantData em um provider e fornece
  // os restaurantes para a aplicação
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantData;
          },
        ),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

// Atalho `stl`
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
