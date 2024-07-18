import 'package:flutter/material.dart';

import '../pages/cart.dart';

class Sandwich {
  final String image;
  final String mainImage;
  final String title;
  final String description;
  final double price;
  bool isFavorite; // New property to track favorite status

  Sandwich({
    required this.image,
    required this.mainImage,
    required this.title,
    required this.description,
    required this.price,
    this.isFavorite = false, // Initialize as not favorite
  });
}

class SandwichMenupage extends StatefulWidget {
  const SandwichMenupage({super.key});

  @override
  State<SandwichMenupage> createState() => _MenuTabState();
}

class _MenuTabState extends State<SandwichMenupage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Sandwich? selectedSandwich;

  final List<Sandwich> sandwiches = [
    Sandwich(
      image: 'assets/images/sandwichtow.jpg',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Classic Sandwich',
      description: 'A classic Sandwich with lettuce, tomato, and cheese.',
      price: 5.99,
    ),
    Sandwich(
      image: 'assets/images/sandwich_7.png',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Bacon Sandwich',
      description: 'A delicious Sandwich topped with crispy bacon.',
      price: 7.99,
    ),
    Sandwich(
      image: 'assets/images/sandwich_6.png',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Cheese sandwich',
      description: 'A Sandwich with double cheese and special sauce.',
      price: 6.99,
    ),
    Sandwich(
      image: 'assets/images/sandwich_4.png',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Veggie sandwich',
      description: 'A healthy veggie sandwich with fresh vegetables.',
      price: 5.49,
    ),
    Sandwich(
      image: 'assets/images/sandwich_5.png',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Spicy Sandwich',
      description: 'A sandwich with a spicy kick and jalapenos.',
      price: 6.49,
    ),
    Sandwich(
      image: 'assets/images/sandwich_5.png',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Tuna Sandwich',
      description: 'A sandwich with a spicy kick and jalapenos.',
      price: 5.49,
    ),
    Sandwich(
      image: 'assets/images/sandwich_5.png',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Ham Sandwich',
      description: 'A sandwich with a spicy kick and jalapenos.',
      price: 4.49,
    ),
  ];

  final List<Sandwich> popularSandwiches = [
    Sandwich(
      image: 'assets/images/sandwich_7.png',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Bacon Sandwich',
      description: 'A delicious Sandwich topped with crispy bacon.',
      price: 7.99,
    ),
    Sandwich(
      image: 'assets/images/sandwich_6.png',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Cheese sandwich',
      description: 'A Sandwich with double cheese and special sauce.',
      price: 6.99,
    ),
  ];

  final List<Sandwich> hotDealsSandwiches = [
    Sandwich(
      image: 'assets/images/sandwich(2).jpg',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Classic Sandwich',
      description: 'A classic Sandwich with lettuce, tomato, and cheese.',
      price: 4.99, // Discounted price for hot deal
    ),
    Sandwich(
      image: 'assets/images/sandwich_5.png',
      mainImage: 'assets/images/sandwich_R2.png',
      title: 'Spicy Sandwich',
      description: 'A sandwich with a spicy kick and jalapenos.',
      price: 5.99, // Discounted price for hot deal
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Listen to tab changes
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void selectSandwich(Sandwich sandwich) {
    setState(() {
      selectedSandwich = sandwich;
    });
  }

  void toggleFavorite(Sandwich sandwich) {
    setState(() {
      sandwich.isFavorite = !sandwich.isFavorite;
    });
  }

  Widget buildSandwichList(List<Sandwich> sandwiches) {
    return Stack(
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: sandwiches.asMap().entries.map((entry) {
                Sandwich sandwich = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: InkWell(
                    onTap: () {
                      selectSandwich(sandwich);
                    },
                    child: Container(
                      width: 70, // Smaller width
                      height: 75, // Smaller height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(sandwich.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: selectedSandwich == null
                  ? const Center(child: Text('Select a sandwich'))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Image.asset(
                                  selectedSandwich!.mainImage,
                                  width: 400,
                                  height: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: Icon(
                                  selectedSandwich!.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: selectedSandwich!.isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 30,
                                ),
                                onPressed: () {
                                  toggleFavorite(selectedSandwich!);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            selectedSandwich!.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            '\$${selectedSandwich!.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 17.5),
                          child: Text(
                            selectedSandwich!.description,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCart()),
              );
            },
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.shopping_bag, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            child: Text(
              'Sandwiches',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            splashFactory: NoSplash.splashFactory,
            tabs: const [
              Tab(text: 'All Sandwiches'),
              Tab(text: 'Popular'),
              Tab(text: 'Hot Deals'),
            ],
            labelStyle: const TextStyle(fontSize: 18),
            unselectedLabelStyle: const TextStyle(fontSize: 14),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicator: const DotTabIndicator(color: Colors.deepOrange),
            indicatorWeight: 5.0,
            dividerColor: Colors.transparent,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[100]!, width: 2.0),
              ),
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  splashColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            buildSandwichList(sandwiches),
            buildSandwichList(popularSandwiches),
            buildSandwichList(hotDealsSandwiches),
          ],
        ),
      ),
    );
  }
}

class DotTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const DotTabIndicator({required this.color, this.radius = 3.0});

  @override
  // ignore: library_private_types_in_public_api
  _DotPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(this, onChanged);
  }
}

class _DotPainter extends BoxPainter {
  final DotTabIndicator decoration;

  _DotPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint()
      ..color = decoration.color
      ..style = PaintingStyle.fill;
    final Offset center =
        Offset(rect.center.dx, rect.bottom - decoration.radius);
    canvas.drawCircle(center, decoration.radius, paint);
  }
}
