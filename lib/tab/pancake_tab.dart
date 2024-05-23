import 'package:flutter/material.dart';

import '../util/pancake_tile.dart';

class PancakeTab extends StatelessWidget {
  List pancakesOnSale = [
    // [ pancake, pancakePrice, pancakeColor, imageName ]
    ["Chocolate", "12", Colors.blue, "lib/images/chocolate_pancake.png"],
    ["Blueberry", "18", Colors.red, "lib/images/blueberry_pancake.png"],
    ["Strawberry", "24", Colors.purple, "lib/images/strawberry_pancake.png"],
    ["Cherry", "35", Colors.brown, "lib/images/cherry_pancake.png"],
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pancakesOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9 / 1.5,
      ),
      itemBuilder: (context, index) {
        return pancakeTile(
          pancake: pancakesOnSale[index][0],
          pancakePrice: pancakesOnSale[index][1],
          pancakeColor: pancakesOnSale[index][2],
          imageName:pancakesOnSale[index][3],
        );
      },
    );
  }
}
