import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:resapp/MenuPages/bbq_menupage.dart';
import 'package:resapp/MenuPages/burger_menupage.dart';
import 'package:resapp/MenuPages/pizza_menupage.dart';
import 'package:resapp/MenuPages/sandwich_menupage.dart';
import '../util/dessert_tile.dart';

class Desserts extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Desserts({super.key});

  @override
  State<Desserts> createState() => _DessertsTabState();
}

class _DessertsTabState extends State<Desserts> {
  // ignore: non_constant_identifier_names
  var DessertList = <List<dynamic>>[
    ["Pancakes", Colors.green, "assets/images/mushroom_pizza.png"],
    ["Cakes", Colors.purple, "assets/images/bg8.png"],
    ["Brownies", Colors.purple, "assets/images/mushroom_pizza.png"],
    ["Icecreams", Colors.brown, "assets/images/mushroom_pizza.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            "Desserts Menu",
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
          itemCount: DessertList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final dessert = DessertList[index];
            return DessertTile(
              dessert: dessert[0],
              dessertColor: dessert[1],
              imageName: dessert[2],
              onTap: () {
                final item = dessert[0];
                if (item == "Pancakes") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PizzaMenupage()),
                  );
                } else if (item == "Cakes") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BbqMenupage()),
                  );
                } else if (item == "Brownies") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BurgerMenuPage()),
                  );
                } else if (item == "Icecreams") {
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
