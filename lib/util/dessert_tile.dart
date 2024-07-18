import 'package:flutter/material.dart';

// ignore: camel_case_types
class DessertTile extends StatelessWidget {
  final String dessert;
  final VoidCallback onTap;
  final Color dessertColor;
  final String imageName;

  final double borderRadius = 12;

  const DessertTile({
    super.key,
    required this.onTap,
    required this.dessert,
    required this.dessertColor,
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
            color: dessertColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            children: [
              // Burger Name
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 70),
                child: Text(
                  dessert,
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
