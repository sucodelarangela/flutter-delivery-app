import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/model/dish.dart';

class CartProvider extends ChangeNotifier {
  final List<Dish> dishesOnCart = [];

  addAllDishes(List<Dish> dishes) {
    dishesOnCart.addAll(dishes);
    notifyListeners(); // Atualiza tudo que tiver "ouvindo" o CartProvider
  }

  removeDish(Dish dish) {
    dishesOnCart.remove(dish);
    notifyListeners();
  }

  clearCart() {
    dishesOnCart.clear();
    notifyListeners();
  }

  Map<Dish, int> getDishMapByAmount() {
    Map<Dish, int> dishMap = {};

    for (Dish dish in dishesOnCart) {
      if (dishMap[dish] == null) {
        dishMap[dish] = 1;
      } else {
        dishMap[dish] = dishMap[dish]! + 1;
      }
    }

    return dishMap;
  }
}
