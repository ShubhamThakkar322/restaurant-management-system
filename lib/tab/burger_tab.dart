import 'package:flutter/material.dart';

import '../util/burger_tile.dart';

class BurgerTab extends StatelessWidget {
  List burgersOnSale = [
    // [ burger, burgerPrice, burgerColor, imageName ]
    ["Burger", "12", Colors.blue, "lib/images/burger.png"],
    ["Hamburger", "24", Colors.red, "lib/images/hamburger.png"],
    ["Cheese burger", "34", Colors.purple, "lib/images/cheese_burger.png"],
    ["Beef burger", "45", Colors.brown, "lib/images/beef_burger.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgersOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9 / 1.5,
      ),
      itemBuilder: (context, index) {
        return burgerTile(
          burger: burgersOnSale[index][0],
          burgerPrice: burgersOnSale[index][1],
          burgerColor: burgersOnSale[index][2],
          imageName: burgersOnSale[index][3],
        );
      },
    );
  }
}
