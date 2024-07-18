import 'package:flutter/material.dart';

// ignore: camel_case_types
class SidesTile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Sides;
  final VoidCallback onTap;
  // ignore: non_constant_identifier_names
  final Color SidesColor;
  final String imageName;

  final double borderRadius = 12;

  const SidesTile({
    super.key,
    required this.onTap,
    // ignore: non_constant_identifier_names
    required this.Sides,
    // ignore: non_constant_identifier_names
    required this.SidesColor,
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
            color: SidesColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            children: [
              // Burger Name
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 70),
                child: Text(
                  Sides,
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
