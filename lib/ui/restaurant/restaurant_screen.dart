import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/model/dish.dart';
import 'package:flutter_delivery_app/model/restaurant.dart';
import 'package:flutter_delivery_app/ui/_core/app_colors.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/${restaurant.imagePath}', width: 128),
            ),
            Text(
              'Mais pedidos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.lightOrange,
              ),
            ),
            Column(
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
                return ListTile(
                  onTap: () {},
                  leading: Image.asset('assets/dishes/default.png', width: 48),
                  title: Text(dish.name),
                  subtitle: Text('R\$ ${dish.price.toStringAsFixed(2)}'),
                  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
