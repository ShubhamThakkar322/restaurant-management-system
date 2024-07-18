import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<MyCart> {
  final List<CartItem> _cartItems = [
    CartItem(
        name: 'Pizza',
        price: 4.10,
        imageUrl: 'assets/images/pizza.png',
        quantity: 1),
    CartItem(
        name: 'Burger',
        price: 4.20,
        imageUrl: 'assets/images/bg6.png',
        quantity: 1),
    CartItem(
        name: 'Smoothie',
        price: 3.50,
        imageUrl: 'assets/images/grape_smoothie.png',
        quantity: 1),
    CartItem(
        name: 'Sandwich',
        price: 4.40,
        imageUrl: 'assets/images/sandwichtow.jpg',
        quantity: 1),
  ];

  void _incrementQuantity(int index) {
    setState(() {
      _cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          final item = _cartItems[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.network(
                item.imageUrl,
                height: 50,
                width: 50,
              ),
              title: Text(item.name),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => _decrementQuantity(index),
                  ),
                  Text(item.quantity.toString()),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _incrementQuantity(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}
