import 'package:flutter/material.dart';

void main() {
  runApp(const HTCIApp());
}

class HTCIApp extends StatelessWidget {
  const HTCIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodOrderPage(),
    );
  }
}

class FoodOrderPage extends StatelessWidget {
  final List<Map<String, dynamic>> foodItems = [
    {
      'image': 'image/burger.jpg',
      'name': 'Cheese Burger',
      'price': 150,
    },
    {
      'image': 'image/pizza.jpg',
      'name': 'Pepperoni Pizza',
      'price': 250,
    },
    {
      'image': 'image/pasta.jpg',
      'name': 'Creamy Pasta',
      'price': 180,
    },
    {
      'image': 'image/sandwich.jpg',
      'name': 'Club Sandwich',
      'price': 120,
    },
    {
      'image': 'image/fries.jpg',
      'name': 'French Fries',
      'price': 90,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Food Order',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final foodItem = foodItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Food Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        foodItem['image'],
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16), // Space between image and text
                    // Food Name and Price
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodItem['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4), // Space between name and price
                          Text(
                            '₹${foodItem['price']}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Buy Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle Buy action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Buy',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
