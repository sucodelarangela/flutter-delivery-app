import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/data/categories_data.dart';
import 'package:flutter_delivery_app/ui/home/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  children: List.generate(Categories.categoriesList.length, (
                    index,
                  ) {
                    return CategoryWidget(
                      category: Categories.categoriesList[index],
                    );
                  }),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text("Bem avaliados"),
              SizedBox(height: 64), // Espaçamento de rolagem
            ],
          ),
        ),
      ),
    );
  }
}
