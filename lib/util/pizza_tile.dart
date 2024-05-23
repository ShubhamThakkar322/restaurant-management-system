import 'package:flutter/material.dart';

class pizzaTile extends StatelessWidget {
  final String pizza;
  final String pizzaPrice;
  final pizzaColor;
  final String imageName;

  final double borderRadius = 12;

  const pizzaTile({
    super.key,
    required this.pizza,
    required this.pizzaPrice,
    required this.pizzaColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pizzaColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: pizzaColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    '\$$pizzaPrice',
                    style: TextStyle(
                      color: pizzaColor[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),

            // donut picture
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16),
              child: Image.asset(imageName),
            ),

            // donut flavor
            Text(
              pizza,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            // love icon + add button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // love icon
                  Icon(
                    Icons.favorite,
                    color: Colors.pink[400],
                  ),

                  // plus button
                  Icon(
                    Icons.add,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
