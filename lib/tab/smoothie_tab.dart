import 'package:flutter/material.dart';

import '../util/smoothie_tile.dart';

class SmoothieTab extends StatelessWidget {
  List smoothiesOnSale = [
    // [ smoothieFlavor, smoothiePrice, smoothieColor, imageName ]
    ["Strawberry", "30", Colors.blue, "lib/images/strawberry_smoothie.png"],
    ["Watermelon", "45", Colors.red, "lib/images/watermelon_smoothie.png"],
    ["Blueberry", "25", Colors.purple, "lib/images/blueberry_smoothie.png"],
    ["Grape", "15", Colors.brown, "lib/images/grape_smoothie.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothiesOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9 / 1.5,
      ),
      itemBuilder: (context, index) {
        return smoothieTile(
          smoothieFlavor: smoothiesOnSale[index][0],
          smoothiePrice: smoothiesOnSale[index][1],
          smoothieColor: smoothiesOnSale[index][2],
          imageName: smoothiesOnSale[index][3],
        );
      },
    );
  }
}
