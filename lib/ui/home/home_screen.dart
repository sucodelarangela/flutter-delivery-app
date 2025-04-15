import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/data/categories_data.dart';
import 'package:flutter_delivery_app/data/restaurant_data.dart';
import 'package:flutter_delivery_app/model/restaurant.dart';
import 'package:flutter_delivery_app/ui/home/widgets/category_widget.dart';
import 'package:flutter_delivery_app/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessando restaurantData através do Provider da main
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Ação do botão de pesquisa
            },
          ),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text("Boas vindas!"),
              TextFormField(),
              Text("Escolha por categoria"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: List.generate(
                    CategoriesData.categoriesList.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.categoriesList[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text("Bem avaliados"),
              Column(
                spacing: 16,
                children: List.generate(restaurantData.restaurantList.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.restaurantList[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 64), // Espaçamento de rolagem
            ],
          ),
        ),
      ),
    );
  }
}
