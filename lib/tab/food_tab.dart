import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:resapp/MenuPages/bbq_menupage.dart';
import 'package:resapp/MenuPages/burger_menupage.dart';
import 'package:resapp/MenuPages/pizza_menupage.dart';
import 'package:resapp/MenuPages/sandwich_menupage.dart';
import '../util/food_tile.dart';

class FoodTab extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  FoodTab({super.key});

  @override
  State<FoodTab> createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  // ignore: non_constant_identifier_names
  var FoodList = <List<dynamic>>[
    ["Pizza", Colors.green, "assets/images/mushroom_pizza.png"],
    ["BBQ", Colors.purple, "assets/images/bg8.png"],
    ["Burgers", Colors.purple, "assets/images/mushroom_pizza.png"],
    ["Sandwich", Colors.brown, "assets/images/mushroom_pizza.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            "Food Menu",
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
          itemCount: FoodList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            // ignore: non_constant_identifier_names
            final Food = FoodList[index];
            return FoodTile(
              Food: Food[0],
              FoodColor: Food[1],
              imageName: Food[2],
              onTap: () {
                final item = Food[0];
                if (item == "Pizza") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PizzaMenupage()),
                  );
                } else if (item == "BBQ") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BbqMenupage()),
                  );
                } else if (item == "Burgers") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BurgerMenuPage()),
                  );
                } else if (item == "Sandwich") {
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
