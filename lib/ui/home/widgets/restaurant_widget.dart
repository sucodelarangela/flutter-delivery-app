import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/model/restaurant.dart';
import 'package:flutter_delivery_app/ui/restaurant/restaurant_screen.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    // Adicionando ação de clique a widgets customizáveis com InkWell e onTap
    // Ao usar apenas .push, o appBar da página seguinte já exibe o botão de voltar
    return InkWell(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantScreen(restaurant: restaurant),
            ),
          ),
      child: Row(
        spacing: 12,
        children: [
          Image.asset('assets/${restaurant.imagePath}', width: 72),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Row(
                children: List.generate(restaurant.stars.toInt(), (index) {
                  return Image.asset('assets/others/star.png', width: 16);
                }),
              ),
              Text('${restaurant.distance}km'),
            ],
          ),
        ],
      ),
    );
  }
}
