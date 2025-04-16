import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/model/dish.dart';
import 'package:flutter_delivery_app/ui/_core/app_colors.dart';
import 'package:flutter_delivery_app/ui/_core/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
        actions: [
          TextButton(
            onPressed: () => cartProvider.clearCart(),
            child: Text("Limpar"),
          ),
        ],
      ),
      body:
          cartProvider.dishesOnCart.isEmpty
              ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nenhum item na sacola',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightOrange,
                    ),
                  ),
                ],
              )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pedidos"),
                      Column(
                        children: List.generate(
                          cartProvider.getDishMapByAmount().keys.length,
                          (index) {
                            Dish dish =
                                cartProvider
                                    .getDishMapByAmount()
                                    .keys
                                    .toList()[index];
                            return ListTile(
                              leading: Image.asset(
                                'assets/dishes/default.png',
                                width: 48,
                              ),
                              title: Text(dish.name),
                              subtitle: Text(
                                'R\$ ${dish.price.toStringAsFixed(2)}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed:
                                        () => cartProvider.removeDish(dish),
                                    icon: Icon(Icons.remove),
                                  ),
                                  Text(
                                    cartProvider
                                        .getDishMapByAmount()[dish]
                                        .toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed:
                                        () => cartProvider.addAllDishes([dish]),
                                    icon: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
