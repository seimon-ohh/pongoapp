import 'package:flutter/material.dart';

class PricingScreen extends StatefulWidget {
  static const routeName = "/pricing-screen";

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pongo Premium 💎", style: TextStyle(fontSize: 16)),
          backgroundColor: Colors.black12,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1
            Column(
              children: [
                _buildProduct(
                  icon: Icons.ac_unit,
                  description: 'Product 1',
                  price: 9.99,
                ),
                _buildProduct(
                  icon: Icons.access_alarm,
                  description: 'Product 2',
                  price: 19.99,
                ),
                _buildProduct(
                  icon: Icons.accessibility_new,
                  description: 'Product 3',
                  price: 29.99,
                ),
              ],
            ),

            // Tab 2
            Column(
              children: [
                _buildProduct(
                  icon: Icons.account_balance,
                  description: 'Product 4',
                  price: 39.99,
                ),
                _buildProduct(
                  icon: Icons.account_box,
                  description: 'Product 5',
                  price: 49.99,
                ),
                _buildProduct(
                  icon: Icons.add_circle_outline,
                  description: 'Product 6',
                  price: 59.99,
                ),
                _buildProduct(
                  icon: Icons.airplanemode_active,
                  description: 'Product 7',
                  price: 69.99,
                ),
                _buildProduct(
                  icon: Icons.attach_money,
                  description: 'Product 8',
                  price: 79.99,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProduct(
      {required IconData icon,
      required String description,
      required double price}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 8.0),
          Expanded(
              child: Text(
                  style: TextStyle(color: Colors.white, fontSize: 10),
                  description)),
          Text('\$${price.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.white, fontSize: 8)),
          SizedBox(width: 8.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              // Handle button press
            },
            child: Text('Buy'),
          ),
        ],
      ),
    );
  }
}
