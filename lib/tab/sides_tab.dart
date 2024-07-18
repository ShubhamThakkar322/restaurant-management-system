import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:resapp/MenuPages/bbq_menupage.dart';
import 'package:resapp/MenuPages/burger_menupage.dart';
import 'package:resapp/MenuPages/pizza_menupage.dart';
import 'package:resapp/MenuPages/sandwich_menupage.dart';
import 'package:resapp/util/sides_tile.dart';

class Sides extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Sides({super.key});

  @override
  State<Sides> createState() => _SidesTabState();
}

class _SidesTabState extends State<Sides> {
  // ignore: non_constant_identifier_names
  var SidesList = <List<dynamic>>[
    ["Pizza Puff", Colors.green, "assets/images/mushroom_pizza.png"],
    ["Pasta", Colors.purple, "assets/images/bg8.png"],
    ["Nuggets", Colors.purple, "assets/images/mushroom_pizza.png"],
    ["Breadsticks", Colors.brown, "assets/images/mushroom_pizza.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            "Sides Menu",
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
          itemCount: SidesList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final side = SidesList[index];
            return SidesTile(
              Sides: side[0],
              SidesColor: side[1],
              imageName: side[2],
              onTap: () {
                final item = side[0];
                if (item == "Pizza Puff") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PizzaMenupage()),
                  );
                } else if (item == "Pasta") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BbqMenupage()),
                  );
                } else if (item == "Breadsticks") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BurgerMenuPage()),
                  );
                } else if (item == "Nuggets") {
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
              return const StaggeredTile.extent(1, 200);
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
