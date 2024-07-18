import 'package:flutter/material.dart';

// ignore: camel_case_types
class SnacksTile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Snacks;
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  final SnacksColor;
  final VoidCallback onTap;
  final String imageName;

  final double borderRadius = 12;

  const SnacksTile({
    super.key,
    required this.onTap,
    // ignore: non_constant_identifier_names
    required this.Snacks,
    // ignore: non_constant_identifier_names
    required this.SnacksColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: SnacksColor[50],
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
                      color: SnacksColor[100],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(borderRadius),
                        topRight: Radius.circular(borderRadius),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 50),
                child: Text(
                  Snacks,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 20),
                child: Image.asset(
                  imageName,
                  height: 163,
                  // color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
