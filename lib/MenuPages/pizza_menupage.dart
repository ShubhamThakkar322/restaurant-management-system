import 'package:flutter/material.dart';

import '../pages/cart.dart';

class Pizza {
  final String image;
  final String mainImage;
  final String title;
  final String description;
  final double price;
  bool isFavorite; // New property to track favorite status

  Pizza({
    required this.image,
    required this.mainImage,
    required this.title,
    required this.description,
    required this.price,
    this.isFavorite = false, // Initialize as not favorite
  });
}

class PizzaMenupage extends StatefulWidget {
  const PizzaMenupage({super.key});

  @override
  State<PizzaMenupage> createState() => _MenuTabState();
}

class _MenuTabState extends State<PizzaMenupage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Pizza? selectedpizza;

  final List<Pizza> pizza = [
    Pizza(
      image: 'assets/images/pizza_l1.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Classic pizza',
      description: 'A classic Pizza with lettuce, tomato, and cheese.',
      price: 5.99,
    ),
    Pizza(
      image: 'assets/images/pizza_l2.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Bacon pizza',
      description: 'A delicious Pizza topped with crispy bacon.',
      price: 7.99,
    ),
    Pizza(
      image: 'assets/images/pizza_l3.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Cheese pizza',
      description: 'A Pizza with double cheese and special sauce.',
      price: 6.99,
    ),
    Pizza(
      image: 'assets/images/pizza_l4.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Veggie pizza',
      description: 'A healthy veggie Pizza with fresh vegetables.',
      price: 5.49,
    ),
    Pizza(
      image: 'assets/images/pizza_l5.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Spicy pizza',
      description: 'A Pizza with a spicy kick and jalapenos.',
      price: 6.49,
    ),
    Pizza(
      image: 'assets/images/pizza_l6.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Tuna pizza',
      description: 'A Pizza with a spicy kick and jalapenos.',
      price: 5.49,
    ),
    Pizza(
      image: 'assets/images/pizza_l7.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Ham pizza',
      description: 'A Pizza with a spicy kick and jalapenos.',
      price: 4.49,
    ),
  ];

  final List<Pizza> popularpizzas = [
    Pizza(
      image: 'assets/images/pizza_l7.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Bacon pizza',
      description: 'A delicious pizza topped with crispy bacon.',
      price: 7.99,
    ),
    Pizza(
      image: 'assets/images/pizza_l6.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Cheese pizza',
      description: 'A pizza with double cheese and special sauce.',
      price: 6.99,
    ),
  ];

  final List<Pizza> hotDealspizzas = [
    Pizza(
      image: 'assets/images/pizza_l1.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Classic Pizza',
      description: 'A classic Pizza with lettuce, tomato, and cheese.',
      price: 4.99, // Discounted price for hot deal
    ),
    Pizza(
      image: 'assets/images/pizza_l5.png',
      mainImage: 'assets/images/pizza_R1.png',
      title: 'Spicy Pizza',
      description: 'A Pizza with a spicy kick and jalapenos.',
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

  void selectpizza(Pizza pizza) {
    setState(() {
      selectedpizza = pizza;
    });
  }

  void toggleFavorite(Pizza pizza) {
    setState(() {
      pizza.isFavorite = !pizza.isFavorite;
    });
  }

  Widget buildpizzalist(List<Pizza> pizza) {
    return Stack(
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: pizza.asMap().entries.map((entry) {
                Pizza pizza = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: InkWell(
                    onTap: () {
                      selectpizza(pizza);
                    },
                    child: Container(
                      width: 70, // Smaller width
                      height: 75, // Smaller height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(pizza.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: selectedpizza == null
                  ? const Center(child: Text('Select a pizza'))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                selectedpizza!.mainImage,
                                width: 400,
                                height: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: Icon(
                                  selectedpizza!.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: selectedpizza!.isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 30,
                                ),
                                onPressed: () {
                                  toggleFavorite(selectedpizza!);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            selectedpizza!.title,
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
                            '\$${selectedpizza!.price.toStringAsFixed(2)}',
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
                            selectedpizza!.description,
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
              'Pizzas',
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
              Tab(text: 'All Pizza'),
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
            buildpizzalist(pizza),
            buildpizzalist(popularpizzas),
            buildpizzalist(hotDealspizzas),
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
