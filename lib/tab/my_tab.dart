import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final bool isSelected;

  const MyTab({super.key, required this.iconPath, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tab(
        height: 100,
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isSelected ? Colors.deepOrange : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            iconPath,
            color: isSelected ? Colors.white : Colors.black,
            height: 20,
          ),
        ),
      ),
    );
  }
}
