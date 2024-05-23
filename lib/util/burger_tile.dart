import 'package:flutter/material.dart';

class burgerTile extends StatelessWidget {
  final String burger;
  final String burgerPrice;
  final burgerColor;
  final String imageName;

  final double borderRadius = 12;

  const burgerTile({
    super.key,
    required this.burger,
    required this.burgerPrice,
    required this.burgerColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: burgerColor[50],
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
                    color: burgerColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    '\$$burgerPrice',
                    style: TextStyle(
                      color: burgerColor[800],
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
              burger,
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
