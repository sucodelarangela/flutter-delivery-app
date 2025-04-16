import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/ui/_core/cart_provider.dart';
import 'package:flutter_delivery_app/ui/checkout/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

AppBar getAppBar({required BuildContext context, String? title}) {
  // AppBar recebe um listener de CartProvider
  CartProvider cartProvider = Provider.of<CartProvider>(context);
  return AppBar(
    title: title != null ? Text(title) : null,
    centerTitle: true,
    actions: [
      badges.Badge(
        showBadge: cartProvider.dishesOnCart.isNotEmpty,
        position: badges.BadgePosition.bottomStart(start: 0, bottom: 0),
        badgeContent: Text(
          cartProvider.dishesOnCart.length.toString(),
          style: TextStyle(fontSize: 10),
        ),
        child: IconButton(
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CheckoutScreen();
                  },
                ),
              ),
          icon: Icon(Icons.shopping_cart),
        ),
      ),
    ],
  );
}
