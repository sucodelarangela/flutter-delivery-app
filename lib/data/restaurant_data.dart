import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_delivery_app/model/restaurant.dart';

// ChangeNotifier permite que a classe possa ser "escutada" pelo resto da aplicação
// sendo passada para toda a aplicação no main
class RestaurantData extends ChangeNotifier {
  List<Restaurant> restaurantList = [];

  Future<void> getRestaurants() async {
    // rootBundle lê textos que estão nossa pasta assets
    String jsonString = await rootBundle.loadString('assets/data.json');

    // decodificando o json em um mapa
    Map<String, dynamic> data = json.decode(jsonString);

    List<dynamic> restaurants = data['restaurants'];

    for (var restaurant in restaurants) {
      restaurantList.add(Restaurant.fromMap(restaurant));
    }
  }
}
