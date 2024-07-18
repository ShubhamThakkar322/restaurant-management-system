import 'package:flutter/material.dart';

// ignore: camel_case_types
class FoodTile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Food;
  final VoidCallback onTap;
  // ignore: non_constant_identifier_names
  final Color FoodColor;
  final String imageName;

  final double borderRadius = 12;

  const FoodTile({
    super.key,
    required this.onTap,
    // ignore: non_constant_identifier_names
    required this.Food,
    // ignore: non_constant_identifier_names
    required this.FoodColor,
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
            color: FoodColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            children: [
              // Burger Name
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 70),
                child: Text(
                  Food,
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
