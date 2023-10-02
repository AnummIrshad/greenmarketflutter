import 'package:flutter/material.dart';
import '../widgets/subheading.dart';
import './homepage.dart';
import './delivery.dart';
import '../components/ordertracking.dart';

void main() {
  runApp(MaterialApp(
    home: CheckoutPage(),
  ));
}

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: SubHeading(
                subtitle: 'Checkout',
              ),
            ),
            // Delivery or Pick Up Option
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to the RegisterPage when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  icon: Icon(Icons.delivery_dining), // Add a delivery icon
                  label: Text(
                    'Delivery',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for the second button
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  icon: Icon(Icons.shopping_bag), // Add a pick-up icon
                  label: Text(
                    'Pick Up',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            // Delivery Address Details
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  SizedBox(height: 10),
                  Text(
                    'Anumm Irshad',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'No 54, Edmonton Road,',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Colombo 5, Sri Lanka',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  
                ],
              ),
            ),
            // Cart Summary
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cart Summary',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Add a list of items in the cart with their details
                  // Example:
                  CartItemRow(
                    itemName: 'Tomatoes',
                    itemQuantity: '200g',
                    itemPrice: '\$10.00',
                  ),
                  CartItemRow(
                    itemName: 'Onions',
                    itemQuantity: '750g',
                    itemPrice: '\$5.00',
                  ),
                ],
              ),
            ),

            // Cart Total and Discounts
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cart Total and Discounts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  CartRow(label: 'SUB TOTAL:', price: '\$20.00'),
                   SizedBox(height: 5),
                  CartRow(label: 'DISCOUNT:', price: '-\$2.00'),
                  CartRow(label: 'TAX:', price: '\$1.80'),
                  CartRow(label: 'TOTAL:', price: '\$19.80', isBold: true),
                ],
              ),
            ),
            // Payment Method Container
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Credit Card Ending in **** 1234',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // Checkout Button
            Container(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Implement your checkout logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MapPage(), // Replace with your Order Tracking page
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartRow extends StatelessWidget {
  final String label;
  final String price;
  final bool isBold;

  CartRow({
    required this.label,
    required this.price,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        SizedBox(width: 10), // Add size box between label and price
        Text(
          price,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class CartItemRow extends StatelessWidget {
  final String itemName;
  final String itemQuantity;
  final String itemPrice;

  CartItemRow({
    required this.itemName,
    required this.itemQuantity,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$itemQuantity x $itemName',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(width: 10), // Add size box between item details and price
        Text(
          itemPrice,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
