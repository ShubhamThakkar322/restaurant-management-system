import 'package:flutter/material.dart';

import '../util/pizza_tile.dart';

class PizzaTab extends StatelessWidget {
  List pizzasOnSale = [
    // [ pizza, pizzaPrice, pizzaColor, imageName ]
    ["Margherita", "10", Colors.blue, "lib/images/margherita_pizza.png"],
    ["Mexican", "30", Colors.red, "lib/images/mexican_pizza.png"],
    ["Mushroom", "20", Colors.purple, "lib/images/mushroom_pizza.png"],
    ["Veggie", "25", Colors.brown, "lib/images/veggie_pizza.png"],
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzasOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9 / 1.5,
      ),
      itemBuilder: (context, index) {
        return pizzaTile(
          pizza: pizzasOnSale[index][0],
          pizzaPrice: pizzasOnSale[index][1],
          pizzaColor: pizzasOnSale[index][2],
          imageName: pizzasOnSale[index][3],
        );
      },
    );
  }
}
