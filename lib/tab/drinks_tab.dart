import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:resapp/MenuPages/bbq_menupage.dart';
import 'package:resapp/MenuPages/burger_menupage.dart';
import 'package:resapp/MenuPages/pizza_menupage.dart';
import 'package:resapp/MenuPages/sandwich_menupage.dart';
import 'package:resapp/util/drinks_tile.dart';

class Drinks extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Drinks({super.key});

  @override
  State<Drinks> createState() => _DrinksTabState();
}

class _DrinksTabState extends State<Drinks> {
  // ignore: non_constant_identifier_names
  var DrinksList = <List<dynamic>>[
    ["Beverages", Colors.green, "assets/images/mushroom_pizza.png"],
    ["Milkshakes", Colors.purple, "assets/images/bg8.png"],
    ["Smoothies", Colors.purple, "assets/images/mushroom_pizza.png"],
    ["Soft drinks", Colors.brown, "assets/images/mushroom_pizza.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            "Drinks Menu",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Urbanist",
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          itemCount: DrinksList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final drink = DrinksList[index];
            return DrinkTile(
              Drink: drink[0],
              DrinkColor: drink[1],
              imageName: drink[2],
              onTap: () {
                final item = drink[0];
                if (item == "Beverages") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PizzaMenupage()),
                  );
                } else if (item == "Milkshakes") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BbqMenupage()),
                  );
                } else if (item == "Smoothies") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BurgerMenuPage()),
                  );
                } else if (item == "Soft drinks") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SandwichMenupage()),
                  );
                }
              },
            );
          },
          staggeredTileBuilder: (int index) {
            if (index == 0 || index == 2) {
              return const StaggeredTile.extent(1, 250);
            } else {
              return const StaggeredTile.extent(1, 250);
            }
          },
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 5.0,
        ),
      ],
    );
  }
}
