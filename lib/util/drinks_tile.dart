import 'package:flutter/material.dart';

// ignore: camel_case_types
class DrinkTile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Drink;
  final VoidCallback onTap;
  // ignore: non_constant_identifier_names
  final Color DrinkColor;
  final String imageName;

  final double borderRadius = 12;

  const DrinkTile({
    super.key,
    required this.onTap,
    // ignore: non_constant_identifier_names
    required this.Drink,
    // ignore: non_constant_identifier_names
    required this.DrinkColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: DrinkColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            children: [
              // Burger Name
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 70),
                child: Text(
                  Drink,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              // Image
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 0),
                child: Image.asset(
                  imageName,
                  height: 163,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
