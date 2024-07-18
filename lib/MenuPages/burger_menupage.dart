import 'package:flutter/material.dart';
import '../pages/cart.dart';

class Burger {
  final String image;
  final String mainImage;
  final String title;
  final String description;
  final double price;
  bool isFavorite; // New property to track favorite status

  Burger({
    required this.image,
    required this.mainImage,
    required this.title,
    required this.description,
    required this.price,
    this.isFavorite = false, // Initialize as not favorite
  });
}

class BurgerMenuPage extends StatefulWidget {
  const BurgerMenuPage({super.key});

  @override
  State<BurgerMenuPage> createState() => _MenuTabState();
}

class _MenuTabState extends State<BurgerMenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Burger? selectedburger;

  final List<Burger> burger = [
    Burger(
      image: 'assets/images/burger_l1.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Classic Burger',
      description: 'A classic Burger with lettuce, tomato, and cheese.',
      price: 5.99,
    ),
    Burger(
      image: 'assets/images/burger_l2.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Bacon Burger',
      description: 'A delicious Burger topped with crispy bacon.',
      price: 7.99,
    ),
    Burger(
      image: 'assets/images/burger_l3.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Cheese Burger',
      description: 'A Burger with double cheese and special sauce.',
      price: 6.99,
    ),
    Burger(
      image: 'assets/images/burger_l4.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Veggie Burger',
      description: 'A healthy veggie Burger with fresh vegetables.',
      price: 5.49,
    ),
    Burger(
      image: 'assets/images/burger_l5.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Spicy Burger',
      description: 'A Burger with a spicy kick and jalapenos.',
      price: 6.49,
    ),
    Burger(
      image: 'assets/images/burger_l6.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Tuna Burger',
      description: 'A Burger with a spicy kick and jalapenos.',
      price: 5.49,
    ),
    Burger(
      image: 'assets/images/burger_l7.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Ham Burger',
      description: 'A Burger with a spicy kick and jalapenos.',
      price: 4.49,
    ),
  ];

  final List<Burger> popularburger = [
    Burger(
      image: 'assets/images/burger_l7.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Bacon Burger',
      description: 'A delicious Burger topped with crispy bacon.',
      price: 7.99,
    ),
    Burger(
      image: 'assets/images/burger_l6.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Cheese Burger',
      description: 'A Burger with double cheese and special sauce.',
      price: 6.99,
    ),
  ];

  final List<Burger> hotDealsburger = [
    Burger(
      image: 'assets/images/burger_l1',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Classic Burger',
      description: 'A classic Burger with lettuce, tomato, and cheese.',
      price: 4.99, // Discounted price for hot deal
    ),
    Burger(
      image: 'assets/images/burger_l5.png',
      mainImage: 'assets/images/Burger_R1.png',
      title: 'Spicy Burger',
      description: 'A Burger with a spicy kick and jalapenos.',
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

  void selectburger(Burger burger) {
    setState(() {
      selectedburger = burger;
    });
  }

  void toggleFavorite(Burger burger) {
    setState(() {
      burger.isFavorite = !burger.isFavorite;
    });
  }

  Widget buildburgerlist(List<Burger> burger) {
    return Stack(
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: burger.asMap().entries.map((entry) {
                // ignore: unused_local_variable
                int index = entry.key;
                Burger burger = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: InkWell(
                    onTap: () {
                      selectburger(burger);
                    },
                    child: Container(
                      width: 70, // Smaller width
                      height: 75, // Smaller height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(burger.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: selectedburger == null
                  ? const Center(child: Text('Select a Burger'))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                selectedburger!.mainImage,
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
                                  selectedburger!.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: selectedburger!.isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 30,
                                ),
                                onPressed: () {
                                  toggleFavorite(selectedburger!);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            selectedburger!.title,
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
                            '\$${selectedburger!.price.toStringAsFixed(2)}',
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
                            selectedburger!.description,
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
              'Burgers',
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
              Tab(text: 'All Burger'),
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
            buildburgerlist(burger),
            buildburgerlist(popularburger),
            buildburgerlist(hotDealsburger),
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
